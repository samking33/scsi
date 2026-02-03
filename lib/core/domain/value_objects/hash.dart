import 'package:equatable/equatable.dart';

class HashDigest extends Equatable {
  const HashDigest(this.hex);

  final String hex;

  @override
  List<Object?> get props => [hex];

  @override
  String toString() => hex;
}
