package com.scsi.scsi_app

import android.Manifest
import android.app.*
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ServiceInfo
import android.graphics.ImageFormat
import android.hardware.camera2.*
import android.media.ImageReader
import android.media.MediaRecorder
import android.os.*
import android.util.Log
import android.view.Surface
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import java.io.File
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.*

/**
 * Background Video Recording Service
 * 
 * Supports simultaneous video recording and high-quality photo capture.
 */
class BackgroundVideoService : Service() {
    
    companion object {
        private const val TAG = "BackgroundVideoService"
        private const val NOTIFICATION_ID = 1001
        private const val CHANNEL_ID = "scsi_recording_channel"
        private const val CHANNEL_NAME = "Evidence Recording"
        
        // Recording configuration
        private const val VIDEO_WIDTH = 1920
        private const val VIDEO_HEIGHT = 1080
        private const val VIDEO_FPS = 30
        private const val VIDEO_BITRATE = 8_000_000 // 8 Mbps
        private const val AUDIO_BITRATE = 128_000 // 128 kbps
        private const val SEGMENT_DURATION_MS = 10 * 60 * 1000L // 10 minutes
        
        // Actions
        const val ACTION_START_RECORDING = "com.scsi.START_RECORDING"
        const val ACTION_STOP_RECORDING = "com.scsi.STOP_RECORDING"
        const val ACTION_TAKE_PHOTO = "com.scsi.TAKE_PHOTO"
        
        // Extras
        const val EXTRA_CASE_ID = "case_id"
        const val EXTRA_OUTPUT_DIR = "output_dir"
        const val EXTRA_RESULT_RECEIVER = "result_receiver"
    }
    
    private var caseId: String? = null
    private var outputDir: File? = null
    private var mediaRecorder: MediaRecorder? = null
    private var imageReader: ImageReader? = null
    private var cameraDevice: CameraDevice? = null
    private var cameraCaptureSession: CameraCaptureSession? = null
    private var wakeLock: PowerManager.WakeLock? = null
    
    private var isRecording = false
    private var segmentNumber = 0
    private var recordingStartTime = 0L
    
    private val handler = Handler(Looper.getMainLooper())
    private val backgroundHandler: Handler
    private val backgroundThread: HandlerThread
    
    init {
        backgroundThread = HandlerThread("CameraBackground")
        backgroundThread.start()
        backgroundHandler = Handler(backgroundThread.looper)
    }
    
    private val segmentRotationRunnable = object : Runnable {
        override fun run() {
            if (isRecording) {
                rotateSegment()
                handler.postDelayed(this, SEGMENT_DURATION_MS)
            }
        }
    }
    
    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "Service created")
        createNotificationChannel()
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START_RECORDING -> {
                val caseId = intent.getStringExtra(EXTRA_CASE_ID)
                val outputPath = intent.getStringExtra(EXTRA_OUTPUT_DIR)
                
                if (caseId != null && outputPath != null) {
                    startRecording(caseId, File(outputPath))
                }
            }
            ACTION_STOP_RECORDING -> {
                stopRecording()
            }
            ACTION_TAKE_PHOTO -> {
                val receiver = intent.getParcelableExtra<ResultReceiver>(EXTRA_RESULT_RECEIVER)
                takePhoto(receiver)
            }
        }
        
        return START_STICKY
    }
    
    override fun onBind(intent: Intent?): IBinder? = null
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                CHANNEL_NAME,
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Continuous evidence recording notification"
                setShowBadge(false)
            }
            
            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun createNotification(): Notification {
        val stopIntent = Intent(this, BackgroundVideoService::class.java).apply {
            action = ACTION_STOP_RECORDING
        }
        val stopPendingIntent = PendingIntent.getService(
            this,
            0,
            stopIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        
        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("SCSI - Recording Evidence")
            .setContentText("Background video recording in progress")
            .setSmallIcon(android.R.drawable.ic_media_play)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .addAction(
                android.R.drawable.ic_media_pause,
                "Stop Recording",
                stopPendingIntent
            )
            .build()
    }
    
    private fun startRecording(caseId: String, outputDir: File) {
        if (isRecording) {
            Log.w(TAG, "Recording already in progress")
            return
        }
        
        this.caseId = caseId
        this.outputDir = outputDir
        
        if (!outputDir.exists()) {
            outputDir.mkdirs()
        }
        
        val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "SCSI::BackgroundRecording"
        )
        wakeLock?.acquire(24 * 60 * 60 * 1000L)
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(
                NOTIFICATION_ID,
                createNotification(),
                ServiceInfo.FOREGROUND_SERVICE_TYPE_CAMERA or
                ServiceInfo.FOREGROUND_SERVICE_TYPE_MICROPHONE
            )
        } else {
            startForeground(NOTIFICATION_ID, createNotification())
        }
        
        openCamera()
        saveRecordingState()
        handler.postDelayed(segmentRotationRunnable, SEGMENT_DURATION_MS)
    }
    
    private fun openCamera() {
        val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        
        try {
            val cameraId = cameraManager.cameraIdList.firstOrNull { id ->
                val characteristics = cameraManager.getCameraCharacteristics(id)
                characteristics.get(CameraCharacteristics.LENS_FACING) == 
                    CameraCharacteristics.LENS_FACING_BACK
            } ?: return
            
            if (ActivityCompat.checkSelfPermission(this, Manifest.permission.CAMERA) 
                != PackageManager.PERMISSION_GRANTED) {
                return
            }
            
            cameraManager.openCamera(cameraId, object : CameraDevice.StateCallback() {
                override fun onOpened(camera: CameraDevice) {
                    cameraDevice = camera
                    startRecordingSession()
                }
                
                override fun onDisconnected(camera: CameraDevice) {
                    camera.close()
                    cameraDevice = null
                }
                
                override fun onError(camera: CameraDevice, error: Int) {
                    camera.close()
                    cameraDevice = null
                }
            }, backgroundHandler)
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to open camera", e)
        }
    }
    
    private fun startRecordingSession() {
        val camera = cameraDevice ?: return
        
        try {
            // Setup MediaRecorder
            mediaRecorder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                MediaRecorder(this)
            } else {
                @Suppress("DEPRECATION")
                MediaRecorder()
            }
            
            val outputFile = getSegmentFile(segmentNumber)
            
            mediaRecorder?.apply {
                setAudioSource(MediaRecorder.AudioSource.MIC)
                setVideoSource(MediaRecorder.VideoSource.SURFACE)
                setOutputFormat(MediaRecorder.OutputFormat.MPEG_4)
                setOutputFile(outputFile.absolutePath)
                setVideoEncoder(MediaRecorder.VideoEncoder.H264)
                setAudioEncoder(MediaRecorder.AudioEncoder.AAC)
                setVideoSize(VIDEO_WIDTH, VIDEO_HEIGHT)
                setVideoFrameRate(VIDEO_FPS)
                setVideoEncodingBitRate(VIDEO_BITRATE)
                setAudioEncodingBitRate(AUDIO_BITRATE)
                prepare()
            }
            
            val recordingSurface = mediaRecorder?.surface ?: return
            
            // Setup ImageReader for photos
            imageReader = ImageReader.newInstance(
                4032, 3024, // High Res
                ImageFormat.JPEG, 2
            )
            
            val photoSurface = imageReader?.surface ?: return
            
            camera.createCaptureSession(
                listOf(recordingSurface, photoSurface),
                object : CameraCaptureSession.StateCallback() {
                    override fun onConfigured(session: CameraCaptureSession) {
                        cameraCaptureSession = session
                        
                        // Video request
                        val captureRequest = camera.createCaptureRequest(
                            CameraDevice.TEMPLATE_RECORD
                        ).apply {
                            addTarget(recordingSurface)
                        }.build()
                        
                        session.setRepeatingRequest(
                            captureRequest,
                            null,
                            backgroundHandler
                        )
                        
                        mediaRecorder?.start()
                        isRecording = true
                        recordingStartTime = System.currentTimeMillis()
                        
                        Log.d(TAG, "Recording started")
                    }
                    
                    override fun onConfigureFailed(session: CameraCaptureSession) {
                        Log.e(TAG, "Failed to configure session")
                    }
                },
                backgroundHandler
            )
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start session", e)
        }
    }
    
    private fun takePhoto(receiver: ResultReceiver?) {
        val camera = cameraDevice ?: return
        val session = cameraCaptureSession ?: return
        val reader = imageReader ?: return
        
        try {
            val photoFile = getPhotoFile()
            
            reader.setOnImageAvailableListener({ reader ->
                val image = reader.acquireNextImage()
                val buffer = image.planes[0].buffer
                val bytes = ByteArray(buffer.remaining())
                buffer.get(bytes)
                
                FileOutputStream(photoFile).use { it.write(bytes) }
                image.close()
                
                // Return path to caller
                val bundle = Bundle().apply {
                    putString("path", photoFile.absolutePath)
                }
                receiver?.send(1, bundle) // 1 = Success
                
            }, backgroundHandler)
            
            val captureRequest = camera.createCaptureRequest(
                CameraDevice.TEMPLATE_STILL_CAPTURE
            ).apply {
                addTarget(reader.surface)
                // Use same orientation as video or sensor orientation
                set(CaptureRequest.CONTROL_AF_MODE, CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_PICTURE)
            }.build()
            
            session.capture(captureRequest, null, backgroundHandler)
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to take photo", e)
            receiver?.send(0, null) // 0 = Failure
        }
    }
    
    // ... Helper methods (rotateSegment, stopRecording, getSegmentFile, etc.) ...
    
    private fun rotateSegment() {
        try {
            mediaRecorder?.stop()
            mediaRecorder?.reset()
            segmentNumber++
            startRecordingSession()
        } catch (e: Exception) {
            Log.e(TAG, "Failed to rotate", e)
        }
    }
    
    private fun stopRecording() {
        isRecording = false
        handler.removeCallbacks(segmentRotationRunnable)
        
        try {
            mediaRecorder?.stop()
            mediaRecorder?.release()
        } catch (e: Exception) {}
        mediaRecorder = null
        
        cameraCaptureSession?.close()
        cameraCaptureSession = null
        cameraDevice?.close()
        cameraDevice = null
        imageReader?.close()
        imageReader = null
        
        wakeLock?.release()
        wakeLock = null
        
        clearRecordingState()
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }
    
    private fun getSegmentFile(segmentNum: Int): File {
        val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())
        return File(outputDir, "${caseId}_segment_${segmentNum}_${timestamp}.mp4")
    }
    
    private fun getPhotoFile(): File {
        val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss_SSS", Locale.US).format(Date())
        return File(outputDir, "${caseId}_evidence_${timestamp}.jpg")
    }
    
    private fun saveRecordingState() {
        val prefs = getSharedPreferences("scsi_recording_state", Context.MODE_PRIVATE)
        prefs.edit().apply {
            putBoolean("is_recording", true)
            putString("case_id", caseId)
            putString("output_dir", outputDir?.absolutePath)
            putInt("segment_number", segmentNumber)
            putLong("start_time", recordingStartTime)
            apply()
        }
    }
    
    private fun clearRecordingState() {
        val prefs = getSharedPreferences("scsi_recording_state", Context.MODE_PRIVATE)
        prefs.edit().clear().apply()
    }
    
    override fun onDestroy() {
        super.onDestroy()
        backgroundThread.quitSafely()
        stopRecording()
    }
}
