import 'dart:io';

import 'package:scsi/core/domain/entities/device_info.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';

class DeviceInfoService {
  Future<DeviceInfo> fetchDeviceInfo() async {
    final deviceId = IdFactory.newDeviceId();
    final manufacturer = Platform.isAndroid ? 'Android' : Platform.operatingSystem;
    final model = Platform.isAndroid ? 'Android Device' : Platform.operatingSystemVersion;
    final osVersion = Platform.operatingSystemVersion;
    const appVersion = '0.1.0';

    return DeviceInfo(
      deviceId: deviceId,
      manufacturer: manufacturer,
      model: model,
      osVersion: osVersion,
      appVersion: appVersion,
    );
  }
}
