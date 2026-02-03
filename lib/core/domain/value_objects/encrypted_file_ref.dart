import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';

class EncryptedFileRef extends Equatable {
  const EncryptedFileRef({
    required this.path,
    required this.sizeBytes,
    required this.sha256,
    required this.createdAt,
  });

  final String path;
  final int sizeBytes;
  final HashDigest sha256;
  final Timestamp createdAt;

  @override
  List<Object?> get props => [path, sizeBytes, sha256, createdAt];
}
