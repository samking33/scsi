package com.scsi.app.recording

import android.content.Intent

internal data class RecordingConfig(
    val caseId: String,
    val sessionId: String,
    val officerId: String,
    val width: Int,
    val height: Int,
    val fps: Int,
    val bitrate: Int,
    val maxSegmentSizeBytes: Long,
    val audioEnabled: Boolean,
){
    companion object {
        fun fromIntent(intent: Intent): RecordingConfig? {
            val caseId = intent.getStringExtra(RecordingIntentKeys.EXTRA_CASE_ID) ?: return null
            val sessionId = intent.getStringExtra(RecordingIntentKeys.EXTRA_SESSION_ID) ?: return null
            val officerId = intent.getStringExtra(RecordingIntentKeys.EXTRA_OFFICER_ID) ?: return null
            val width = intent.getIntExtra(RecordingIntentKeys.EXTRA_WIDTH, 1920)
            val height = intent.getIntExtra(RecordingIntentKeys.EXTRA_HEIGHT, 1080)
            val fps = intent.getIntExtra(RecordingIntentKeys.EXTRA_FPS, 30)
            val bitrate = intent.getIntExtra(RecordingIntentKeys.EXTRA_BITRATE, 10_000_000)
            val maxSegmentSize = intent.getLongExtra(
                RecordingIntentKeys.EXTRA_MAX_SEGMENT_SIZE,
                1_500_000_000L,
            )
            val audioEnabled = intent.getBooleanExtra(
                RecordingIntentKeys.EXTRA_AUDIO_ENABLED,
                true,
            )

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
    }
}

internal data class SegmentInfo(
    val index: Int,
    val fileName: String,
    val filePath: String,
    val sizeBytes: Long,
    val sha256: String,
    val startUtc: String,
    val endUtc: String,
    val startOffsetMs: Long,
    val endOffsetMs: Long,
    val finalized: Boolean,
    val abrupt: Boolean,
)

internal object RecordingIntentKeys {
    const val ACTION_START = "com.scsi.app.recording.START"
    const val ACTION_STOP = "com.scsi.app.recording.STOP"
    const val ACTION_STATUS = "com.scsi.app.recording.STATUS"

    const val EXTRA_CASE_ID = "caseId"
    const val EXTRA_SESSION_ID = "sessionId"
    const val EXTRA_OFFICER_ID = "officerId"
    const val EXTRA_WIDTH = "width"
    const val EXTRA_HEIGHT = "height"
    const val EXTRA_FPS = "fps"
    const val EXTRA_BITRATE = "bitrate"
    const val EXTRA_MAX_SEGMENT_SIZE = "maxSegmentSizeBytes"
    const val EXTRA_AUDIO_ENABLED = "audioEnabled"
}

internal fun RecordingConfig.toIntent(intent: Intent): Intent = intent.apply {
    putExtra(RecordingIntentKeys.EXTRA_CASE_ID, caseId)
    putExtra(RecordingIntentKeys.EXTRA_SESSION_ID, sessionId)
    putExtra(RecordingIntentKeys.EXTRA_OFFICER_ID, officerId)
    putExtra(RecordingIntentKeys.EXTRA_WIDTH, width)
    putExtra(RecordingIntentKeys.EXTRA_HEIGHT, height)
    putExtra(RecordingIntentKeys.EXTRA_FPS, fps)
    putExtra(RecordingIntentKeys.EXTRA_BITRATE, bitrate)
    putExtra(RecordingIntentKeys.EXTRA_MAX_SEGMENT_SIZE, maxSegmentSizeBytes)
    putExtra(RecordingIntentKeys.EXTRA_AUDIO_ENABLED, audioEnabled)
}
