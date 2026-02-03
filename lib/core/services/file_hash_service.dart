import 'dart:io';

import 'package:scsi/core/crypto/hash_utils.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class FileHashService {
  Future<EncryptedFileRef> toFileRef(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    final hash = sha256Hex(bytes);
    final size = await file.length();
    return EncryptedFileRef(
      path: path,
      sizeBytes: size,
      sha256: hash,
      createdAt: Timestamp.nowUtc(),
    );
  }
}
