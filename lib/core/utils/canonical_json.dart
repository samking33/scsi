import 'dart:convert';

Object? _canonicalize(Object? value) {
  if (value is Map) {
    final sortedKeys = value.keys.map((k) => k.toString()).toList()..sort();
    final result = <String, Object?>{};
    for (final key in sortedKeys) {
      result[key] = _canonicalize(value[key]);
    }
    return result;
  }
  if (value is Iterable) {
    return value.map(_canonicalize).toList(growable: false);
  }
  if (value is DateTime) {
    return value.toUtc().toIso8601String();
  }
  if (value is Duration) {
    return value.inMilliseconds;
  }
  return value;
}

String canonicalJsonEncode(Map<String, Object?> json) {
  final canonical = _canonicalize(json) as Map<String, Object?>;
  return jsonEncode(canonical);
}
