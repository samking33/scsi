package com.scsi.scsi_app

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.ResultReceiver
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import java.io.File

class MainActivity: FlutterActivity() {
    private val METHOD_CHANNEL = "com.scsi.scsi_app/video_recording"
    private val EVENT_CHANNEL = "com.scsi.scsi_app/recording_events"
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Method channel for video recording control
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "startBackgroundRecording" -> {
                        val caseId = call.argument<String>("caseId")
                        val outputDir = call.argument<String>("outputDir")
                        
                        if (caseId != null && outputDir != null) {
                            startBackgroundRecording(caseId, outputDir)
                            result.success(true)
                        } else {
                            result.error("INVALID_ARGS", "Missing caseId or outputDir", null)
                        }
                    }
                    "stopBackgroundRecording" -> {
                        stopBackgroundRecording()
                        result.success(true)
                    }
                    "getRecordingStatus" -> {
                        val status = getRecordingStatus()
                        result.success(status)
                    }
                    "takePhoto" -> {
                        takePhoto(result)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
    
    private fun startBackgroundRecording(caseId: String, outputDir: String) {
        val intent = Intent(this, BackgroundVideoService::class.java).apply {
            action = BackgroundVideoService.ACTION_START_RECORDING
            putExtra(BackgroundVideoService.EXTRA_CASE_ID, caseId)
            putExtra(BackgroundVideoService.EXTRA_OUTPUT_DIR, outputDir)
        }
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(intent)
        } else {
            startService(intent)
        }
    }
    
    private fun stopBackgroundRecording() {
        val intent = Intent(this, BackgroundVideoService::class.java).apply {
            action = BackgroundVideoService.ACTION_STOP_RECORDING
        }
        startService(intent)
    }
    
    private fun takePhoto(flutterResult: MethodChannel.Result) {
        val resultReceiver = object : ResultReceiver(Handler(Looper.getMainLooper())) {
            override fun onReceiveResult(resultCode: Int, resultData: Bundle?) {
                if (resultCode == 1 && resultData != null) {
                    val path = resultData.getString("path")
                    flutterResult.success(path)
                } else {
                    flutterResult.error("CAPTURE_FAILED", "Failed to capture photo", null)
                }
            }
        }
        
        val intent = Intent(this, BackgroundVideoService::class.java).apply {
            action = BackgroundVideoService.ACTION_TAKE_PHOTO
            putExtra(BackgroundVideoService.EXTRA_RESULT_RECEIVER, resultReceiver)
        }
        startService(intent)
    }
    
    private fun getRecordingStatus(): Map<String, Any> {
        val prefs = getSharedPreferences("scsi_recording_state", MODE_PRIVATE)
        return mapOf(
            "isRecording" to prefs.getBoolean("is_recording", false),
            "caseId" to (prefs.getString("case_id", "") ?: ""),
            "segmentNumber" to prefs.getInt("segment_number", 0),
            "startTime" to prefs.getLong("start_time", 0)
        )
    }
}
