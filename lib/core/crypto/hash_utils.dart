import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:scsi/core/domain/value_objects/hash.dart';

HashDigest sha256Hex(List<int> bytes) {
  final digest = sha256.convert(bytes);
  return HashDigest(digest.toString());
}

HashDigest sha256String(String value) => sha256Hex(utf8.encode(value));
