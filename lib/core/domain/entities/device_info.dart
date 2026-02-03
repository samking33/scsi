import 'package:equatable/equatable.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';

class DeviceInfo extends Equatable {
  const DeviceInfo({
    required this.deviceId,
    required this.manufacturer,
    required this.model,
    required this.osVersion,
    required this.appVersion,
  });

  final DeviceId deviceId;
  final String manufacturer;
  final String model;
  final String osVersion;
  final String appVersion;

  @override
  List<Object?> get props => [deviceId, manufacturer, model, osVersion, appVersion];
}
