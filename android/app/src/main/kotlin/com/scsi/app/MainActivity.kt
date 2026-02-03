package com.scsi.app

import android.content.Intent
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat
import com.scsi.app.recording.RecordingConfig
import com.scsi.app.recording.RecordingIntentKeys
import com.scsi.app.recording.RecordingSessionStore
import com.scsi.app.recording.RecordingService
import com.scsi.app.recording.toIntent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_RECORDING).setMethodCallHandler { call, result ->
            when (call.method) {
                "startRecording" -> {
                    val config = parseConfig(call.arguments as? Map<*, *>)
                    if (config == null) {
                        result.error("INVALID_ARGS", "Missing recording parameters", null)
                        return@setMethodCallHandler
                    }
                    if (!hasRequiredPermissions()) {
                        result.error("PERMISSION_DENIED", "Camera and microphone permissions are required", null)
                        return@setMethodCallHandler
                    }
                    val intent = Intent(this, RecordingService::class.java).apply {
                        action = RecordingIntentKeys.ACTION_START
                        config.toIntent(this)
                    }
                    ContextCompat.startForegroundService(this, intent)
                    val sessionDir = RecordingSessionStore(this).sessionDir(config.caseId, config.sessionId)
                    result.success(mapOf("sessionDir" to sessionDir.absolutePath))
                }
                "stopRecording" -> {
                    val intent = Intent(this, RecordingService::class.java).apply {
                        action = RecordingIntentKeys.ACTION_STOP
                    }
                    startService(intent)
                    result.success(true)
                }
                "isRecording" -> {
                    val active = RecordingSessionStore(this).readActiveSession()
                    result.success(active != null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun parseConfig(args: Map<*, *>?): RecordingConfig? {
        if (args == null) return null
        val caseId = args["caseId"] as? String ?: return null
        val sessionId = args["sessionId"] as? String ?: return null
        val officerId = args["officerId"] as? String ?: return null
        val width = (args["width"] as? Number)?.toInt() ?: 1920
        val height = (args["height"] as? Number)?.toInt() ?: 1080
        val fps = (args["fps"] as? Number)?.toInt() ?: 30
        val bitrate = (args["bitrate"] as? Number)?.toInt() ?: 10_000_000
        val maxSegmentSize = (args["maxSegmentSizeBytes"] as? Number)?.toLong() ?: 1_500_000_000L
        val audioEnabled = args["audioEnabled"] as? Boolean ?: true

        return RecordingConfig(
            caseId = caseId,
            sessionId = sessionId,
            officerId = officerId,
            width = width,
            height = height,
            fps = fps,
            bitrate = bitrate,
            maxSegmentSizeBytes = maxSegmentSize,
            audioEnabled = audioEnabled,
        )
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

    companion object {
        private const val CHANNEL_RECORDING = "com.scsi.app/recording"
    }
}
