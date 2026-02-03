package com.scsi.app.recording

import android.content.Context
import android.os.Environment
import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.security.MessageDigest

internal class RecordingSessionStore(private val context: Context) {
    private val rootDir: File by lazy {
        val base = context.getExternalFilesDir(Environment.DIRECTORY_MOVIES) ?: context.filesDir
        File(base, "recordings")
    }

    private val activeFile: File by lazy {
        File(context.filesDir, "recordings/active_session.json")
    }

    fun sessionDir(caseId: String, sessionId: String): File {
        return File(rootDir, "cases/$caseId/$sessionId")
    }

    fun ensureSessionDir(caseId: String, sessionId: String): File {
        val dir = sessionDir(caseId, sessionId)
        if (!dir.exists()) {
            dir.mkdirs()
        }
        val segmentsDir = File(dir, "segments")
        if (!segmentsDir.exists()) {
            segmentsDir.mkdirs()
        }
        return dir
    }

    fun writeNewSessionMetadata(
        config: RecordingConfig,
        startedAtUtc: String,
        startedAtElapsedMs: Long,
    ) {
        val dir = ensureSessionDir(config.caseId, config.sessionId)
        val metadataFile = File(dir, "session.json")
        val metadata = JSONObject()
            .put("caseId", config.caseId)
            .put("sessionId", config.sessionId)
            .put("officerId", config.officerId)
            .put("startedAtUtc", startedAtUtc)
            .put("startedAtElapsedMs", startedAtElapsedMs)
            .put("endedAtUtc", JSONObject.NULL)
            .put("width", config.width)
            .put("height", config.height)
            .put("fps", config.fps)
            .put("bitrate", config.bitrate)
            .put("audioEnabled", config.audioEnabled)
            .put("maxSegmentSizeBytes", config.maxSegmentSizeBytes)
            .put("abruptShutdown", false)
            .put("segments", JSONArray())

        writeAtomic(metadataFile, metadata.toString())
    }

    fun appendSegment(sessionDir: File, segmentInfo: SegmentInfo) {
        val metadataFile = File(sessionDir, "session.json")
        val metadata = readJson(metadataFile) ?: JSONObject()
        val segments = metadata.optJSONArray("segments") ?: JSONArray()

        val segmentJson = JSONObject()
            .put("index", segmentInfo.index)
            .put("fileName", segmentInfo.fileName)
            .put("filePath", segmentInfo.filePath)
            .put("sizeBytes", segmentInfo.sizeBytes)
            .put("sha256", segmentInfo.sha256)
            .put("startUtc", segmentInfo.startUtc)
            .put("endUtc", segmentInfo.endUtc)
            .put("startOffsetMs", segmentInfo.startOffsetMs)
            .put("endOffsetMs", segmentInfo.endOffsetMs)
            .put("finalized", segmentInfo.finalized)
            .put("abrupt", segmentInfo.abrupt)

        segments.put(segmentJson)
        metadata.put("segments", segments)
        writeAtomic(metadataFile, metadata.toString())
    }

    fun markSessionEnded(sessionDir: File, endedAtUtc: String, abrupt: Boolean) {
        val metadataFile = File(sessionDir, "session.json")
        val metadata = readJson(metadataFile) ?: JSONObject()
        metadata.put("endedAtUtc", endedAtUtc)
        metadata.put("abruptShutdown", abrupt)
        writeAtomic(metadataFile, metadata.toString())
    }

    fun readLastSegmentEndOffset(sessionDir: File): Long {
        val metadataFile = File(sessionDir, "session.json")
        val metadata = readJson(metadataFile) ?: return 0L
        val segments = metadata.optJSONArray("segments") ?: return 0L
        if (segments.length() == 0) return 0L
        val last = segments.getJSONObject(segments.length() - 1)
        return last.optLong("endOffsetMs", 0L)
    }

    fun readSessionStartedAtUtc(sessionDir: File): String? {
        val metadataFile = File(sessionDir, "session.json")
        val metadata = readJson(metadataFile) ?: return null
        return metadata.optString("startedAtUtc", null)
    }

    fun readSegmentCount(sessionDir: File): Int {
        val metadataFile = File(sessionDir, "session.json")
        val metadata = readJson(metadataFile) ?: return 0
        val segments = metadata.optJSONArray("segments") ?: return 0
        return segments.length()
    }

    fun writeActiveSession(config: RecordingConfig, startedAtUtc: String, startedAtElapsedMs: Long) {
        val dir = ensureSessionDir(config.caseId, config.sessionId)
        val active = JSONObject()
            .put("caseId", config.caseId)
            .put("sessionId", config.sessionId)
            .put("officerId", config.officerId)
            .put("startedAtUtc", startedAtUtc)
            .put("startedAtElapsedMs", startedAtElapsedMs)
            .put("width", config.width)
            .put("height", config.height)
            .put("fps", config.fps)
            .put("bitrate", config.bitrate)
            .put("audioEnabled", config.audioEnabled)
            .put("maxSegmentSizeBytes", config.maxSegmentSizeBytes)
            .put("sessionDir", dir.absolutePath)

        if (!activeFile.parentFile.exists()) {
            activeFile.parentFile.mkdirs()
        }
        writeAtomic(activeFile, active.toString())
    }

    fun readActiveSession(): JSONObject? {
        if (!activeFile.exists()) return null
        return readJson(activeFile)
    }

    fun clearActiveSession() {
        if (activeFile.exists()) {
            activeFile.delete()
        }
    }

    fun computeSha256(file: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        FileInputStream(file).use { input ->
            val buffer = ByteArray(1024 * 1024)
            var read = input.read(buffer)
            while (read > 0) {
                digest.update(buffer, 0, read)
                read = input.read(buffer)
            }
        }
        return digest.digest().joinToString("") { byte -> "%02x".format(byte) }
    }

    private fun writeAtomic(file: File, content: String) {
        val tmp = File(file.parentFile, file.name + ".tmp")
        FileOutputStream(tmp).use { output ->
            output.write(content.toByteArray())
            output.fd.sync()
        }
        if (file.exists()) {
            file.delete()
        }
        tmp.renameTo(file)
    }

    private fun readJson(file: File): JSONObject? {
        return try {
            val text = file.readText()
            JSONObject(text)
        } catch (ex: Exception) {
            null
        }
    }
}
