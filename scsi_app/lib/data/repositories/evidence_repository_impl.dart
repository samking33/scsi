import '../datasources/database_manager.dart';
import '../models/evidence_mapper.dart';
import '../../domain/entities/evidence.dart';
import '../../domain/repositories/evidence_repository.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class EvidenceRepositoryImpl implements EvidenceRepository {
  final DatabaseManager _databaseManager;
  
  EvidenceRepositoryImpl(this._databaseManager);
  
  @override
  Future<void> saveEvidence(Evidence evidence) async {
    final db = await _databaseManager.database;
    
    await db.transaction((txn) async {
      // 1. Insert evidence record
      final evidenceMap = EvidenceMapper.toMap(evidence);
      await txn.insert(
        'evidence',
        evidenceMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      
      // 2. Insert detections if PhotoEvidence
      if (evidence is PhotoEvidence) {
        for (final detection in evidence.detections) {
          await txn.insert('detections', {
            'evidence_id': evidence.id,
            'class_name': detection.className,
            'confidence': detection.confidence,
            'bbox_x': detection.boundingBox.x,
            'bbox_y': detection.boundingBox.y,
            'bbox_width': detection.boundingBox.width,
            'bbox_height': detection.boundingBox.height,
          });
        }
      }
    });
  }
  
  @override
  Future<List<Evidence>> getEvidenceForCase(String caseId) async {
    final db = await _databaseManager.database;
    
    // Get all evidence records
    final evidenceMaps = await db.query(
      'evidence',
      where: 'case_id = ?',
      whereArgs: [caseId],
      orderBy: 'timestamp ASC',
    );
    
    final result = <Evidence>[];
    
    for (final map in evidenceMaps) {
      final id = map['id'] as String;
      final typeStr = map['type'] as String;
      
      // Get detections if photo
      final detections = <Detection>[];
      if (typeStr == EvidenceType.photo.name) {
        final detectionMaps = await db.query(
          'detections',
          where: 'evidence_id = ?',
          whereArgs: [id],
        );
        
        for (final dMap in detectionMaps) {
          detections.add(Detection(
            className: dMap['class_name'] as String,
            confidence: dMap['confidence'] as double,
            boundingBox: BoundingBox(
              x: dMap['bbox_x'] as double,
              y: dMap['bbox_y'] as double,
              width: dMap['bbox_width'] as double,
              height: dMap['bbox_height'] as double,
            ),
          ));
        }
      }
      
      result.add(EvidenceMapper.fromMap(map, detections));
    }
    
    return result;
  }
  
  @override
  Future<Evidence?> getEvidenceById(String id) async {
    final db = await _databaseManager.database;
    
    final maps = await db.query(
      'evidence',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    final typeStr = map['type'] as String;
    
    final detections = <Detection>[];
    if (typeStr == EvidenceType.photo.name) {
      final detectionMaps = await db.query(
        'detections',
        where: 'evidence_id = ?',
        whereArgs: [id],
      );
      
      for (final dMap in detectionMaps) {
        detections.add(Detection(
          className: dMap['class_name'] as String,
          confidence: dMap['confidence'] as double,
          boundingBox: BoundingBox(
            x: dMap['bbox_x'] as double,
            y: dMap['bbox_y'] as double,
            width: dMap['bbox_width'] as double,
            height: dMap['bbox_height'] as double,
          ),
        ));
      }
    }
    
    return EvidenceMapper.fromMap(map, detections);
  }
  
  @override
  Future<void> deleteEvidence(String id) async {
    // Note: Secure deletion of FILE handled by use case
    // This only removes DB record.
    final db = await _databaseManager.database;
    await db.transaction((txn) async {
      await txn.delete('detections', where: 'evidence_id = ?', whereArgs: [id]);
      await txn.delete('evidence', where: 'id = ?', whereArgs: [id]);
    });
  }
}
