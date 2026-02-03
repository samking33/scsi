import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';

class Officer extends Equatable {
  const Officer({
    required this.id,
    required this.fullName,
    required this.badgeNumber,
    required this.agency,
    required this.rank,
  });

  final OfficerId id;
  final String fullName;
  final String badgeNumber;
  final String agency;
  final String rank;

  @override
  List<Object?> get props => [id, fullName, badgeNumber, agency, rank];
}
