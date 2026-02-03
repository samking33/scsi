import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:scsi/core/services/file_hash_service.dart';
import 'package:scsi/core/domain/value_objects/encrypted_file_ref.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';

class EvidenceCaptureService {
  EvidenceCaptureService(this._hashService);

  final FileHashService _hashService;

  Future<EncryptedFileRef> savePhoto({
    required CaseId caseId,
    required XFile photo,
  }) async {
    final dir = await _caseEvidenceDir(caseId, 'photos');
    final name = 'photo_${DateTime.now().toUtc().millisecondsSinceEpoch}.jpg';
    final file = await File(photo.path).copy(p.join(dir.path, name));
    return _hashService.toFileRef(file.path);
  }

  Future<EncryptedFileRef> saveAudio({
    required CaseId caseId,
    required String audioPath,
  }) async {
    final dir = await _caseEvidenceDir(caseId, 'audio');
    final name = 'audio_${DateTime.now().toUtc().millisecondsSinceEpoch}.m4a';
    final file = await File(audioPath).copy(p.join(dir.path, name));
    return _hashService.toFileRef(file.path);
  }

  Future<Directory> _caseEvidenceDir(CaseId caseId, String child) async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, 'evidence', caseId.value, child));
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return dir;
  }
}
