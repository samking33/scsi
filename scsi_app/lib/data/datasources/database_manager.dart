import 'package:sqflite_sqlcipher/sqflite.dart' hide DatabaseException;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../core/constants/app_constants.dart';
import '../../core/encryption/secure_key_manager.dart';
import '../../core/error/exceptions.dart' as app_exceptions;

/// Encrypted SQLite database manager
/// Uses SQLCipher for AES-256-GCM encryption
class DatabaseManager {
  static DatabaseManager? _instance;
  Database? _database;
  
  DatabaseManager._();
  
  factory DatabaseManager() {
    _instance ??= DatabaseManager._();
    return _instance!;
  }
  
  /// Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  
  /// Initialize encrypted database
  Future<Database> _initDatabase() async {
    try {
      // Get application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, AppConstants.databaseName);
      
      // Get encryption key from secure storage
      final keyBytes = await SecureKeyManager.getDatabaseEncryptionKey();
      final password = String.fromCharCodes(keyBytes);
      
      // Open encrypted database
      final db = await openDatabase(
        path,
        version: AppConstants.databaseVersion,
        password: password,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
      
      return db;
    } catch (e) {
      throw app_exceptions.DatabaseException(
        'Failed to initialize database',
        originalError: e,
      );
    }
  }
  
  /// Create database schema
  Future<void> _onCreate(Database db, int version) async {
    // Cases table
    await db.execute('''
      CREATE TABLE cases (
        id TEXT PRIMARY KEY,
        officer_id TEXT NOT NULL,
        officer_name TEXT NOT NULL,
        officer_badge_number TEXT NOT NULL,
        case_type TEXT NOT NULL,
        description TEXT NOT NULL,
        start_time INTEGER NOT NULL,
        end_time INTEGER,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        location_address TEXT NOT NULL,
        status TEXT NOT NULL,
        timezone_offset TEXT NOT NULL
      )
    ''');
    
    // Evidence table
    await db.execute('''
      CREATE TABLE evidence (
        id TEXT PRIMARY KEY,
        case_id TEXT NOT NULL,
        type TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        video_offset_ms INTEGER NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        file_hash TEXT NOT NULL,
        file_path TEXT NOT NULL,
        notes TEXT,
        metadata TEXT,
        FOREIGN KEY (case_id) REFERENCES cases (id)
      )
    ''');
    
    // Create index on case_id for faster queries
    await db.execute('''
      CREATE INDEX idx_evidence_case_id ON evidence(case_id)
    ''');
    
    // Detections table
    await db.execute('''
      CREATE TABLE detections (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        evidence_id TEXT NOT NULL,
        class_name TEXT NOT NULL,
        confidence REAL NOT NULL,
        bbox_x REAL NOT NULL,
        bbox_y REAL NOT NULL,
        bbox_width REAL NOT NULL,
        bbox_height REAL NOT NULL,
        FOREIGN KEY (evidence_id) REFERENCES evidence (id)
      )
    ''');
    
    // Chain of custody logs table
    await db.execute('''
      CREATE TABLE chain_of_custody_logs (
        id TEXT PRIMARY KEY,
        case_id TEXT NOT NULL,
        evidence_id TEXT NOT NULL,
        action TEXT NOT NULL,
        officer_id TEXT NOT NULL,
        officer_name TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        previous_log_hash TEXT NOT NULL,
        current_log_hash TEXT NOT NULL,
        metadata TEXT,
        FOREIGN KEY (case_id) REFERENCES cases (id),
        FOREIGN KEY (evidence_id) REFERENCES evidence (id)
      )
    ''');
    
    // Location points table
    await db.execute('''
      CREATE TABLE location_points (
        id TEXT PRIMARY KEY,
        case_id TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        accuracy REAL NOT NULL,
        altitude REAL,
        speed REAL,
        heading REAL,
        timestamp INTEGER NOT NULL,
        FOREIGN KEY (case_id) REFERENCES cases (id)
      )
    ''');
    
    // Create index on case_id for location points
    await db.execute('''
      CREATE INDEX idx_location_points_case_id ON location_points(case_id)
    ''');
  }
  
  /// Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle schema migrations here
    // For now, we're on version 1
  }
  
  // MARK: - DAO Methods
  
  /// Insert new case
  Future<void> insertCase(Map<String, dynamic> caseData) async {
    final db = await database;
    await db.insert(
      'cases', 
      caseData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  /// Get case by ID
  Future<Map<String, dynamic>?> getCaseById(String id) async {
    final db = await database;
    final results = await db.query(
      'cases',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  /// Insert evidence
  Future<void> insertEvidence(Map<String, dynamic> evidenceData) async {
    final db = await database;
    await db.insert(
      'evidence', 
      evidenceData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  /// Get evidence for case
  Future<List<Map<String, dynamic>>> getEvidenceForCase(String caseId) async {
    final db = await database;
    return await db.query(
      'evidence',
      where: 'case_id = ?',
      whereArgs: [caseId],
      orderBy: 'timestamp ASC',
    );
  }
  
  /// Get evidence by ID
  Future<Map<String, dynamic>?> getEvidenceById(String id) async {
    final db = await database;
    final results = await db.query(
      'evidence',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  /// Insert log
  Future<void> insertLog(Map<String, dynamic> logData) async {
    final db = await database;
    await db.insert('chain_of_custody_logs', logData);
  }
  
  /// Get logs for case (chronological)
  Future<List<Map<String, dynamic>>> getLogsForCase(String caseId) async {
    final db = await database;
    return await db.query(
      'chain_of_custody_logs',
      where: 'case_id = ?',
      whereArgs: [caseId],
      orderBy: 'timestamp ASC',
    );
  }
  
  /// Get last log hash for case (for chaining)
  Future<String?> getLastLogHash(String caseId) async {
    final db = await database;
    final result = await db.query(
      'chain_of_custody_logs',
      columns: ['current_log_hash'],
      where: 'case_id = ?',
      whereArgs: [caseId],
      orderBy: 'timestamp DESC',
      limit: 1,
    );
    
    if (result.isNotEmpty) {
      return result.first['current_log_hash'] as String;
    }
    return null;
  }
  
  /// Insert location point
  Future<void> insertLocationPoint(Map<String, dynamic> locationData) async {
    final db = await database;
    await db.insert('location_points', locationData);
  }
  
  /// Close database
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
  
  /// Delete database (use with extreme caution)
  Future<void> deleteDatabase() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, AppConstants.databaseName);
      final file = File(path);
      
      if (await file.exists()) {
        await file.delete();
      }
      
      _database = null;
    } catch (e) {
      throw app_exceptions.DatabaseException(
        'Failed to delete database',
        originalError: e,
      );
    }
  }
}
