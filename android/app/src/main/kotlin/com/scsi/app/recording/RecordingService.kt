package com.scsi.app.recording

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.hardware.camera2.CameraCaptureSession
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraDevice
import android.hardware.camera2.CameraManager
import android.hardware.camera2.CaptureRequest
import android.media.MediaRecorder
import android.os.Build
import android.os.Handler
import android.os.HandlerThread
import android.os.IBinder
import android.os.PowerManager
import android.os.SystemClock
import android.util.Range
import android.util.Size
import android.view.Surface
import android.view.WindowManager
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import org.json.JSONObject
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone
import java.util.concurrent.Executors
import java.util.concurrent.Semaphore
import java.util.concurrent.TimeUnit

class RecordingService : Service() {
    private val cameraOpenCloseLock = Semaphore(1)
    private val ioExecutor = Executors.newSingleThreadExecutor()
    private val sessionStore by lazy { RecordingSessionStore(this) }

    private var cameraManager: CameraManager? = null
    private var cameraDevice: CameraDevice? = null
    private var captureSession: CameraCaptureSession? = null
    private var mediaRecorder: MediaRecorder? = null
    private var cameraHandlerThread: HandlerThread? = null
    private var cameraHandler: Handler? = null
    private var wakeLock: PowerManager.WakeLock? = null

    private var recordingConfig: RecordingConfig? = null
    private var sessionDir: File? = null
    private var segmentsDir: File? = null
    private var segmentSequence = 0
    private var currentSegmentIndex = 0
    private var nextSegmentIndex = 0
    private var currentSegmentFile: File? = null
    private var nextSegmentFile: File? = null
    private var segmentStartUtc: String = ""
    private var segmentStartOffsetMs: Long = 0L
    private var resumeStartElapsedMs: Long = 0L
    private var offsetBaseMs: Long = 0L
    private var isRecording = false

    override fun onCreate() {
        super.onCreate()
        cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        cameraHandlerThread = HandlerThread("ScsiCameraThread").apply { start() }
        cameraHandler = Handler(cameraHandlerThread!!.looper)
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val action = intent?.action

        if (action == RecordingIntentKeys.ACTION_STOP) {
            stopRecordingInternal(abrupt = false)
            stopSelf()
            return START_NOT_STICKY
        }

        if (action == RecordingIntentKeys.ACTION_START) {
            val config = RecordingConfig.fromIntent(intent)
            if (config != null) {
                startForeground(NOTIFICATION_ID, buildNotification())
                if (!startRecording(config, resume = false)) {
                    stopForeground(STOP_FOREGROUND_REMOVE)
                    stopSelf()
                }
                return START_STICKY
            }
        }

        if (intent == null) {
            val active = sessionStore.readActiveSession()
            if (active != null) {
                val config = parseConfig(active)
                if (config != null) {
                    startForeground(NOTIFICATION_ID, buildNotification())
                    if (!startRecording(config, resume = true)) {
                        stopForeground(STOP_FOREGROUND_REMOVE)
                        stopSelf()
                    }
                    return START_STICKY
                }
            }
        }

        return START_NOT_STICKY
    }

    override fun onDestroy() {
        stopRecordingInternal(abrupt = true)
        cameraHandlerThread?.quitSafely()
        ioExecutor.shutdown()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    private fun startRecording(
        config: RecordingConfig,
        resume: Boolean,
    ): Boolean {
        if (isRecording) return true
        if (!hasRequiredPermissions()) return false

        val nowUtc = isoUtcNow()
        val nowElapsed = SystemClock.elapsedRealtime()
        val dir = sessionStore.ensureSessionDir(config.caseId, config.sessionId)
        val segmentsDirectory = File(dir, "segments")

        recordingConfig = config
        sessionDir = dir
        segmentsDir = segmentsDirectory

        if (!resume) {
            sessionStore.writeNewSessionMetadata(config, nowUtc, nowElapsed)
            segmentSequence = 0
            currentSegmentIndex = 0
            nextSegmentIndex = 0
            offsetBaseMs = 0L
        } else {
            val lastOffset = sessionStore.readLastSegmentEndOffset(dir)
            val count = sessionStore.readSegmentCount(dir)
            segmentSequence = count
            currentSegmentIndex = 0
            nextSegmentIndex = 0
            offsetBaseMs = lastOffset
        }

        val sessionStartUtc = if (resume) {
            sessionStore.readSessionStartedAtUtc(dir) ?: nowUtc
        } else {
            nowUtc
        }

        sessionStore.writeActiveSession(config, sessionStartUtc, nowElapsed)
        resumeStartElapsedMs = nowElapsed
        acquireWakeLock()

        cameraHandler?.post {
            try {
                openCameraAndStartRecorder(config)
            } catch (ex: Exception) {
                stopRecordingInternal(abrupt = true)
            }
        }

        isRecording = true
        return true
    }

    private fun stopRecordingInternal(abrupt: Boolean) {
        if (!isRecording) return
        isRecording = false

        cameraHandler?.post {
            try {
                captureSession?.stopRepeating()
                captureSession?.abortCaptures()
            } catch (_: Exception) {
            }

            try {
                mediaRecorder?.stop()
            } catch (_: Exception) {
                // Stop can throw if the recorder was not fully started; mark abrupt.
            }

            releaseRecorder()
            closeCamera()

            val dir = sessionDir
            if (dir != null) {
                finalizeCurrentSegment(abrupt = abrupt)
                sessionStore.markSessionEnded(dir, isoUtcNow(), abrupt)
            }
            sessionStore.clearActiveSession()
        }

        releaseWakeLock()
        stopForeground(STOP_FOREGROUND_REMOVE)
    }

    private fun openCameraAndStartRecorder(config: RecordingConfig) {
        val manager = cameraManager ?: return
        val cameraId = selectBackCameraId(manager) ?: return
        val characteristics = manager.getCameraCharacteristics(cameraId)
        val videoSize = chooseVideoSize(characteristics, config)

        if (!cameraOpenCloseLock.tryAcquire(2500, TimeUnit.MILLISECONDS)) {
            return
        }

        manager.openCamera(cameraId, object : CameraDevice.StateCallback() {
            override fun onOpened(camera: CameraDevice) {
                cameraOpenCloseLock.release()
                cameraDevice = camera
                setupMediaRecorder(config, videoSize)
                startCaptureSession(camera)
            }

            override fun onDisconnected(camera: CameraDevice) {
                cameraOpenCloseLock.release()
                camera.close()
                cameraDevice = null
            }

            override fun onError(camera: CameraDevice, error: Int) {
                cameraOpenCloseLock.release()
                camera.close()
                cameraDevice = null
            }
        }, cameraHandler)
    }

    private fun startCaptureSession(camera: CameraDevice) {
        val recorder = mediaRecorder ?: return
        val surface = recorder.surface
        val requestBuilder = camera.createCaptureRequest(CameraDevice.TEMPLATE_RECORD)
        requestBuilder.addTarget(surface)
        val fps = recordingConfig?.fps ?: 30
        applyFpsRangeIfAvailable(camera, requestBuilder, fps)

        camera.createCaptureSession(
            listOf(surface),
            object : CameraCaptureSession.StateCallback() {
                override fun onConfigured(session: CameraCaptureSession) {
                    captureSession = session
                    session.setRepeatingRequest(requestBuilder.build(), null, cameraHandler)
                    recorder.start()
                    segmentStartUtc = isoUtcNow()
                    segmentStartOffsetMs = offsetBaseMs + (SystemClock.elapsedRealtime() - resumeStartElapsedMs)
                }

                override fun onConfigureFailed(session: CameraCaptureSession) {
                }
            },
            cameraHandler,
        )
    }

    private fun setupMediaRecorder(config: RecordingConfig, size: Size) {
        val recorder = MediaRecorder()
        if (config.audioEnabled) {
            recorder.setAudioSource(MediaRecorder.AudioSource.MIC)
        }
        recorder.setVideoSource(MediaRecorder.VideoSource.SURFACE)
        recorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4)

        val (segmentIndex, file) = allocateSegmentFile()
        currentSegmentIndex = segmentIndex
        currentSegmentFile = file
        recorder.setOutputFile(file.absolutePath)

        recorder.setVideoEncodingBitRate(config.bitrate)
        recorder.setVideoFrameRate(config.fps)
        recorder.setVideoSize(size.width, size.height)
        recorder.setVideoEncoder(MediaRecorder.VideoEncoder.H264)
        if (config.audioEnabled) {
            recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AAC)
            recorder.setAudioEncodingBitRate(128_000)
            recorder.setAudioSamplingRate(48_000)
        }
        recorder.setOrientationHint(calculateOrientationHint())

        if (config.maxSegmentSizeBytes > 0) {
            recorder.setMaxFileSize(config.maxSegmentSizeBytes)
            val (nextIndex, nextFile) = allocateSegmentFile()
            nextSegmentIndex = nextIndex
            nextSegmentFile = nextFile
            recorder.setNextOutputFile(nextFile)
        }

        recorder.setOnInfoListener { _, what, _ ->
            if (what == MediaRecorder.MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED) {
                rotateSegment()
            }
            if (what == MediaRecorder.MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED) {
                // If the next output file could not be started, we stop to avoid data loss.
                stopRecordingInternal(abrupt = true)
            }
        }

        recorder.prepare()
        mediaRecorder = recorder

    }

    private fun rotateSegment() {
        val previousFile = currentSegmentFile
        val previousIndex = currentSegmentIndex
        val newCurrent = nextSegmentFile
        val newIndex = nextSegmentIndex
        if (previousFile != null) {
            finalizeSegmentFile(previousFile, previousIndex, segmentStartUtc, segmentStartOffsetMs, abrupt = false)
        }

        currentSegmentFile = newCurrent
        currentSegmentIndex = newIndex
        segmentStartUtc = isoUtcNow()
        segmentStartOffsetMs = offsetBaseMs + (SystemClock.elapsedRealtime() - resumeStartElapsedMs)

        val recorder = mediaRecorder ?: return
        val config = recordingConfig ?: return
        if (config.maxSegmentSizeBytes > 0) {
            val (freshIndex, freshNext) = allocateSegmentFile()
            nextSegmentIndex = freshIndex
            nextSegmentFile = freshNext
            recorder.setNextOutputFile(freshNext)
        }
    }

    private fun finalizeCurrentSegment(abrupt: Boolean) {
        val file = currentSegmentFile ?: return
        finalizeSegmentFile(file, currentSegmentIndex, segmentStartUtc, segmentStartOffsetMs, abrupt)
    }

    private fun finalizeSegmentFile(
        file: File,
        index: Int,
        startUtc: String,
        startOffsetMs: Long,
        abrupt: Boolean,
    ) {
        val dir = sessionDir ?: return
        val endUtc = isoUtcNow()
        val endOffsetMs = offsetBaseMs + (SystemClock.elapsedRealtime() - resumeStartElapsedMs)

        ioExecutor.execute {
            val size = file.length()
            val hash = sessionStore.computeSha256(file)
            val info = SegmentInfo(
                index = index,
                fileName = file.name,
                filePath = file.absolutePath,
                sizeBytes = size,
                sha256 = hash,
                startUtc = startUtc,
                endUtc = endUtc,
                startOffsetMs = startOffsetMs,
                endOffsetMs = endOffsetMs,
                finalized = !abrupt,
                abrupt = abrupt,
            )
            sessionStore.appendSegment(dir, info)
        }
    }

    private fun createSegmentFile(index: Int): File {
        val dir = segmentsDir ?: sessionDir?.let { File(it, "segments") } ?: filesDir
        if (!dir.exists()) dir.mkdirs()
        val timestamp = isoUtcForFile()
        val name = "segment_%04d_%s.mp4".format(index, timestamp)
        return File(dir, name)
    }

    private fun allocateSegmentFile(): Pair<Int, File> {
        segmentSequence += 1
        val index = segmentSequence
        return index to createSegmentFile(index)
    }

    private fun releaseRecorder() {
        try {
            mediaRecorder?.reset()
            mediaRecorder?.release()
        } catch (_: Exception) {
        }
        mediaRecorder = null
    }

    private fun closeCamera() {
        try {
            captureSession?.close()
        } catch (_: Exception) {
        }
        captureSession = null
        try {
            cameraDevice?.close()
        } catch (_: Exception) {
        }
        cameraDevice = null
    }

    private fun selectBackCameraId(manager: CameraManager): String? {
        for (id in manager.cameraIdList) {
            val characteristics = manager.getCameraCharacteristics(id)
            val facing = characteristics.get(CameraCharacteristics.LENS_FACING)
            if (facing == CameraCharacteristics.LENS_FACING_BACK) {
                return id
            }
        }
        return manager.cameraIdList.firstOrNull()
    }

    private fun chooseVideoSize(
        characteristics: CameraCharacteristics,
        config: RecordingConfig,
    ): Size {
        val map = characteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)
        val sizes = map?.getOutputSizes(MediaRecorder::class.java)?.toList() ?: emptyList()
        val preferred = Size(config.width, config.height)
        if (sizes.contains(preferred)) return preferred
        val sixteenByNine = sizes.filter { it.width * 9 == it.height * 16 }
        return (sixteenByNine.maxByOrNull { it.width * it.height }
            ?: sizes.maxByOrNull { it.width * it.height }
            ?: preferred)
    }

    private fun applyFpsRangeIfAvailable(
        camera: CameraDevice,
        builder: CaptureRequest.Builder,
        fps: Int,
    ) {
        try {
            val characteristics = cameraManager?.getCameraCharacteristics(camera.id) ?: return
            val ranges = characteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES)
                ?: return
            val target = Range(fps, fps)
            if (ranges.contains(target)) {
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, target)
            }
        } catch (_: Exception) {
        }
    }

    private fun calculateOrientationHint(): Int {
        val windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        @Suppress("DEPRECATION")
        val fallbackRotation = windowManager.defaultDisplay.rotation
        val rotation = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            display?.rotation ?: fallbackRotation
        } else {
            fallbackRotation
        }
        val degrees = when (rotation) {
            Surface.ROTATION_0 -> 0
            Surface.ROTATION_90 -> 90
            Surface.ROTATION_180 -> 180
            Surface.ROTATION_270 -> 270
            else -> 0
        }
        return degrees
    }

    private fun buildNotification(): Notification {
        val stopIntent = Intent(this, RecordingService::class.java).apply {
            action = RecordingIntentKeys.ACTION_STOP
        }
        val stopPending = PendingIntent.getService(
            this,
            100,
            stopIntent,
            PendingIntent.FLAG_IMMUTABLE,
        )

        return NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
            .setContentTitle("Recording evidence")
            .setContentText("Background video capture in progress")
            .setSmallIcon(android.R.drawable.presence_video_online)
            .setOngoing(true)
            .addAction(NotificationCompat.Action(0, "Stop", stopPending))
            .build()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                NOTIFICATION_CHANNEL_ID,
                "Recording",
                NotificationManager.IMPORTANCE_LOW,
            )
            channel.description = "Evidence recording status"
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }
    }

    private fun hasRequiredPermissions(): Boolean {
        val cameraGranted = ContextCompat.checkSelfPermission(
            this,
            android.Manifest.permission.CAMERA,
        ) == PackageManager.PERMISSION_GRANTED
        val audioGranted = ContextCompat.checkSelfPermission(
            this,
            android.Manifest.permission.RECORD_AUDIO,
        ) == PackageManager.PERMISSION_GRANTED
        return cameraGranted && audioGranted
    }

    private fun acquireWakeLock() {
        if (wakeLock?.isHeld == true) return
        val power = getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = power.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "scsi:recording",
        ).apply { acquire() }
    }

    private fun releaseWakeLock() {
        if (wakeLock?.isHeld == true) {
            wakeLock?.release()
        }
        wakeLock = null
    }

    private fun parseConfig(json: JSONObject): RecordingConfig? {
        return try {
            RecordingConfig(
                caseId = json.getString("caseId"),
                sessionId = json.getString("sessionId"),
                officerId = json.getString("officerId"),
                width = json.getInt("width"),
                height = json.getInt("height"),
                fps = json.getInt("fps"),
                bitrate = json.getInt("bitrate"),
                maxSegmentSizeBytes = json.getLong("maxSegmentSizeBytes"),
                audioEnabled = json.getBoolean("audioEnabled"),
            )
        } catch (_: Exception) {
            null
        }
    }

    private fun isoUtcNow(): String {
        val format = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US)
        format.timeZone = TimeZone.getTimeZone("UTC")
        return format.format(Date())
    }

    private fun isoUtcForFile(): String {
        val format = SimpleDateFormat("yyyyMMdd'T'HHmmss'Z'", Locale.US)
        format.timeZone = TimeZone.getTimeZone("UTC")
        return format.format(Date())
    }

    companion object {
        private const val NOTIFICATION_CHANNEL_ID = "scsi_recording"
        private const val NOTIFICATION_ID = 2201
    }
}
