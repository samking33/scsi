import 'package:equatable/equatable.dart';

class Timestamp extends Equatable {
  const Timestamp._(this.utc);

  final DateTime utc;

  // All persisted times are normalized to UTC for court-defensible ordering.
  factory Timestamp.nowUtc() => Timestamp._(DateTime.now().toUtc());

  factory Timestamp.from(DateTime dateTime) =>
      Timestamp._(dateTime.isUtc ? dateTime : dateTime.toUtc());

  int get epochMillis => utc.millisecondsSinceEpoch;

  @override
  List<Object?> get props => [epochMillis];
}
