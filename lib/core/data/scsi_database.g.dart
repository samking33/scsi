// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scsi_database.dart';

// ignore_for_file: type=lint
class $CasesTable extends Cases with TableInfo<$CasesTable, CaseRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _jurisdictionMeta =
      const VerificationMeta('jurisdiction');
  @override
  late final GeneratedColumn<String> jurisdiction = GeneratedColumn<String>(
      'jurisdiction', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _officerIdMeta =
      const VerificationMeta('officerId');
  @override
  late final GeneratedColumn<String> officerId = GeneratedColumn<String>(
      'officer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _officerNameMeta =
      const VerificationMeta('officerName');
  @override
  late final GeneratedColumn<String> officerName = GeneratedColumn<String>(
      'officer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _officerBadgeMeta =
      const VerificationMeta('officerBadge');
  @override
  late final GeneratedColumn<String> officerBadge = GeneratedColumn<String>(
      'officer_badge', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _officerAgencyMeta =
      const VerificationMeta('officerAgency');
  @override
  late final GeneratedColumn<String> officerAgency = GeneratedColumn<String>(
      'officer_agency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _officerRankMeta =
      const VerificationMeta('officerRank');
  @override
  late final GeneratedColumn<String> officerRank = GeneratedColumn<String>(
      'officer_rank', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceManufacturerMeta =
      const VerificationMeta('deviceManufacturer');
  @override
  late final GeneratedColumn<String> deviceManufacturer =
      GeneratedColumn<String>('device_manufacturer', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceModelMeta =
      const VerificationMeta('deviceModel');
  @override
  late final GeneratedColumn<String> deviceModel = GeneratedColumn<String>(
      'device_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceOsVersionMeta =
      const VerificationMeta('deviceOsVersion');
  @override
  late final GeneratedColumn<String> deviceOsVersion = GeneratedColumn<String>(
      'device_os_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceAppVersionMeta =
      const VerificationMeta('deviceAppVersion');
  @override
  late final GeneratedColumn<String> deviceAppVersion = GeneratedColumn<String>(
      'device_app_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _initialLatMeta =
      const VerificationMeta('initialLat');
  @override
  late final GeneratedColumn<double> initialLat = GeneratedColumn<double>(
      'initial_lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _initialLngMeta =
      const VerificationMeta('initialLng');
  @override
  late final GeneratedColumn<double> initialLng = GeneratedColumn<double>(
      'initial_lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _initialAltMeta =
      const VerificationMeta('initialAlt');
  @override
  late final GeneratedColumn<double> initialAlt = GeneratedColumn<double>(
      'initial_alt', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _initialAccuracyMeta =
      const VerificationMeta('initialAccuracy');
  @override
  late final GeneratedColumn<double> initialAccuracy = GeneratedColumn<double>(
      'initial_accuracy', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _initialHeadingMeta =
      const VerificationMeta('initialHeading');
  @override
  late final GeneratedColumn<double> initialHeading = GeneratedColumn<double>(
      'initial_heading', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _initialSpeedMeta =
      const VerificationMeta('initialSpeed');
  @override
  late final GeneratedColumn<double> initialSpeed = GeneratedColumn<double>(
      'initial_speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        jurisdiction,
        createdAt,
        officerId,
        officerName,
        officerBadge,
        officerAgency,
        officerRank,
        deviceId,
        deviceManufacturer,
        deviceModel,
        deviceOsVersion,
        deviceAppVersion,
        initialLat,
        initialLng,
        initialAlt,
        initialAccuracy,
        initialHeading,
        initialSpeed
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cases';
  @override
  VerificationContext validateIntegrity(Insertable<CaseRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('jurisdiction')) {
      context.handle(
          _jurisdictionMeta,
          jurisdiction.isAcceptableOrUnknown(
              data['jurisdiction']!, _jurisdictionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('officer_id')) {
      context.handle(_officerIdMeta,
          officerId.isAcceptableOrUnknown(data['officer_id']!, _officerIdMeta));
    } else if (isInserting) {
      context.missing(_officerIdMeta);
    }
    if (data.containsKey('officer_name')) {
      context.handle(
          _officerNameMeta,
          officerName.isAcceptableOrUnknown(
              data['officer_name']!, _officerNameMeta));
    } else if (isInserting) {
      context.missing(_officerNameMeta);
    }
    if (data.containsKey('officer_badge')) {
      context.handle(
          _officerBadgeMeta,
          officerBadge.isAcceptableOrUnknown(
              data['officer_badge']!, _officerBadgeMeta));
    } else if (isInserting) {
      context.missing(_officerBadgeMeta);
    }
    if (data.containsKey('officer_agency')) {
      context.handle(
          _officerAgencyMeta,
          officerAgency.isAcceptableOrUnknown(
              data['officer_agency']!, _officerAgencyMeta));
    } else if (isInserting) {
      context.missing(_officerAgencyMeta);
    }
    if (data.containsKey('officer_rank')) {
      context.handle(
          _officerRankMeta,
          officerRank.isAcceptableOrUnknown(
              data['officer_rank']!, _officerRankMeta));
    } else if (isInserting) {
      context.missing(_officerRankMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('device_manufacturer')) {
      context.handle(
          _deviceManufacturerMeta,
          deviceManufacturer.isAcceptableOrUnknown(
              data['device_manufacturer']!, _deviceManufacturerMeta));
    } else if (isInserting) {
      context.missing(_deviceManufacturerMeta);
    }
    if (data.containsKey('device_model')) {
      context.handle(
          _deviceModelMeta,
          deviceModel.isAcceptableOrUnknown(
              data['device_model']!, _deviceModelMeta));
    } else if (isInserting) {
      context.missing(_deviceModelMeta);
    }
    if (data.containsKey('device_os_version')) {
      context.handle(
          _deviceOsVersionMeta,
          deviceOsVersion.isAcceptableOrUnknown(
              data['device_os_version']!, _deviceOsVersionMeta));
    } else if (isInserting) {
      context.missing(_deviceOsVersionMeta);
    }
    if (data.containsKey('device_app_version')) {
      context.handle(
          _deviceAppVersionMeta,
          deviceAppVersion.isAcceptableOrUnknown(
              data['device_app_version']!, _deviceAppVersionMeta));
    } else if (isInserting) {
      context.missing(_deviceAppVersionMeta);
    }
    if (data.containsKey('initial_lat')) {
      context.handle(
          _initialLatMeta,
          initialLat.isAcceptableOrUnknown(
              data['initial_lat']!, _initialLatMeta));
    } else if (isInserting) {
      context.missing(_initialLatMeta);
    }
    if (data.containsKey('initial_lng')) {
      context.handle(
          _initialLngMeta,
          initialLng.isAcceptableOrUnknown(
              data['initial_lng']!, _initialLngMeta));
    } else if (isInserting) {
      context.missing(_initialLngMeta);
    }
    if (data.containsKey('initial_alt')) {
      context.handle(
          _initialAltMeta,
          initialAlt.isAcceptableOrUnknown(
              data['initial_alt']!, _initialAltMeta));
    }
    if (data.containsKey('initial_accuracy')) {
      context.handle(
          _initialAccuracyMeta,
          initialAccuracy.isAcceptableOrUnknown(
              data['initial_accuracy']!, _initialAccuracyMeta));
    }
    if (data.containsKey('initial_heading')) {
      context.handle(
          _initialHeadingMeta,
          initialHeading.isAcceptableOrUnknown(
              data['initial_heading']!, _initialHeadingMeta));
    }
    if (data.containsKey('initial_speed')) {
      context.handle(
          _initialSpeedMeta,
          initialSpeed.isAcceptableOrUnknown(
              data['initial_speed']!, _initialSpeedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      jurisdiction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}jurisdiction']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      officerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}officer_id'])!,
      officerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}officer_name'])!,
      officerBadge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}officer_badge'])!,
      officerAgency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}officer_agency'])!,
      officerRank: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}officer_rank'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      deviceManufacturer: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}device_manufacturer'])!,
      deviceModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_model'])!,
      deviceOsVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}device_os_version'])!,
      deviceAppVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}device_app_version'])!,
      initialLat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_lat'])!,
      initialLng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_lng'])!,
      initialAlt: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_alt']),
      initialAccuracy: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}initial_accuracy']),
      initialHeading: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_heading']),
      initialSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_speed']),
    );
  }

  @override
  $CasesTable createAlias(String alias) {
    return $CasesTable(attachedDatabase, alias);
  }
}

class CaseRecord extends DataClass implements Insertable<CaseRecord> {
  final String id;
  final String title;
  final String? description;
  final String? jurisdiction;
  final int createdAt;
  final String officerId;
  final String officerName;
  final String officerBadge;
  final String officerAgency;
  final String officerRank;
  final String deviceId;
  final String deviceManufacturer;
  final String deviceModel;
  final String deviceOsVersion;
  final String deviceAppVersion;
  final double initialLat;
  final double initialLng;
  final double? initialAlt;
  final double? initialAccuracy;
  final double? initialHeading;
  final double? initialSpeed;
  const CaseRecord(
      {required this.id,
      required this.title,
      this.description,
      this.jurisdiction,
      required this.createdAt,
      required this.officerId,
      required this.officerName,
      required this.officerBadge,
      required this.officerAgency,
      required this.officerRank,
      required this.deviceId,
      required this.deviceManufacturer,
      required this.deviceModel,
      required this.deviceOsVersion,
      required this.deviceAppVersion,
      required this.initialLat,
      required this.initialLng,
      this.initialAlt,
      this.initialAccuracy,
      this.initialHeading,
      this.initialSpeed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || jurisdiction != null) {
      map['jurisdiction'] = Variable<String>(jurisdiction);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['officer_id'] = Variable<String>(officerId);
    map['officer_name'] = Variable<String>(officerName);
    map['officer_badge'] = Variable<String>(officerBadge);
    map['officer_agency'] = Variable<String>(officerAgency);
    map['officer_rank'] = Variable<String>(officerRank);
    map['device_id'] = Variable<String>(deviceId);
    map['device_manufacturer'] = Variable<String>(deviceManufacturer);
    map['device_model'] = Variable<String>(deviceModel);
    map['device_os_version'] = Variable<String>(deviceOsVersion);
    map['device_app_version'] = Variable<String>(deviceAppVersion);
    map['initial_lat'] = Variable<double>(initialLat);
    map['initial_lng'] = Variable<double>(initialLng);
    if (!nullToAbsent || initialAlt != null) {
      map['initial_alt'] = Variable<double>(initialAlt);
    }
    if (!nullToAbsent || initialAccuracy != null) {
      map['initial_accuracy'] = Variable<double>(initialAccuracy);
    }
    if (!nullToAbsent || initialHeading != null) {
      map['initial_heading'] = Variable<double>(initialHeading);
    }
    if (!nullToAbsent || initialSpeed != null) {
      map['initial_speed'] = Variable<double>(initialSpeed);
    }
    return map;
  }

  CasesCompanion toCompanion(bool nullToAbsent) {
    return CasesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      jurisdiction: jurisdiction == null && nullToAbsent
          ? const Value.absent()
          : Value(jurisdiction),
      createdAt: Value(createdAt),
      officerId: Value(officerId),
      officerName: Value(officerName),
      officerBadge: Value(officerBadge),
      officerAgency: Value(officerAgency),
      officerRank: Value(officerRank),
      deviceId: Value(deviceId),
      deviceManufacturer: Value(deviceManufacturer),
      deviceModel: Value(deviceModel),
      deviceOsVersion: Value(deviceOsVersion),
      deviceAppVersion: Value(deviceAppVersion),
      initialLat: Value(initialLat),
      initialLng: Value(initialLng),
      initialAlt: initialAlt == null && nullToAbsent
          ? const Value.absent()
          : Value(initialAlt),
      initialAccuracy: initialAccuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(initialAccuracy),
      initialHeading: initialHeading == null && nullToAbsent
          ? const Value.absent()
          : Value(initialHeading),
      initialSpeed: initialSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(initialSpeed),
    );
  }

  factory CaseRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseRecord(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      jurisdiction: serializer.fromJson<String?>(json['jurisdiction']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      officerId: serializer.fromJson<String>(json['officerId']),
      officerName: serializer.fromJson<String>(json['officerName']),
      officerBadge: serializer.fromJson<String>(json['officerBadge']),
      officerAgency: serializer.fromJson<String>(json['officerAgency']),
      officerRank: serializer.fromJson<String>(json['officerRank']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      deviceManufacturer:
          serializer.fromJson<String>(json['deviceManufacturer']),
      deviceModel: serializer.fromJson<String>(json['deviceModel']),
      deviceOsVersion: serializer.fromJson<String>(json['deviceOsVersion']),
      deviceAppVersion: serializer.fromJson<String>(json['deviceAppVersion']),
      initialLat: serializer.fromJson<double>(json['initialLat']),
      initialLng: serializer.fromJson<double>(json['initialLng']),
      initialAlt: serializer.fromJson<double?>(json['initialAlt']),
      initialAccuracy: serializer.fromJson<double?>(json['initialAccuracy']),
      initialHeading: serializer.fromJson<double?>(json['initialHeading']),
      initialSpeed: serializer.fromJson<double?>(json['initialSpeed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'jurisdiction': serializer.toJson<String?>(jurisdiction),
      'createdAt': serializer.toJson<int>(createdAt),
      'officerId': serializer.toJson<String>(officerId),
      'officerName': serializer.toJson<String>(officerName),
      'officerBadge': serializer.toJson<String>(officerBadge),
      'officerAgency': serializer.toJson<String>(officerAgency),
      'officerRank': serializer.toJson<String>(officerRank),
      'deviceId': serializer.toJson<String>(deviceId),
      'deviceManufacturer': serializer.toJson<String>(deviceManufacturer),
      'deviceModel': serializer.toJson<String>(deviceModel),
      'deviceOsVersion': serializer.toJson<String>(deviceOsVersion),
      'deviceAppVersion': serializer.toJson<String>(deviceAppVersion),
      'initialLat': serializer.toJson<double>(initialLat),
      'initialLng': serializer.toJson<double>(initialLng),
      'initialAlt': serializer.toJson<double?>(initialAlt),
      'initialAccuracy': serializer.toJson<double?>(initialAccuracy),
      'initialHeading': serializer.toJson<double?>(initialHeading),
      'initialSpeed': serializer.toJson<double?>(initialSpeed),
    };
  }

  CaseRecord copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<String?> jurisdiction = const Value.absent(),
          int? createdAt,
          String? officerId,
          String? officerName,
          String? officerBadge,
          String? officerAgency,
          String? officerRank,
          String? deviceId,
          String? deviceManufacturer,
          String? deviceModel,
          String? deviceOsVersion,
          String? deviceAppVersion,
          double? initialLat,
          double? initialLng,
          Value<double?> initialAlt = const Value.absent(),
          Value<double?> initialAccuracy = const Value.absent(),
          Value<double?> initialHeading = const Value.absent(),
          Value<double?> initialSpeed = const Value.absent()}) =>
      CaseRecord(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        jurisdiction:
            jurisdiction.present ? jurisdiction.value : this.jurisdiction,
        createdAt: createdAt ?? this.createdAt,
        officerId: officerId ?? this.officerId,
        officerName: officerName ?? this.officerName,
        officerBadge: officerBadge ?? this.officerBadge,
        officerAgency: officerAgency ?? this.officerAgency,
        officerRank: officerRank ?? this.officerRank,
        deviceId: deviceId ?? this.deviceId,
        deviceManufacturer: deviceManufacturer ?? this.deviceManufacturer,
        deviceModel: deviceModel ?? this.deviceModel,
        deviceOsVersion: deviceOsVersion ?? this.deviceOsVersion,
        deviceAppVersion: deviceAppVersion ?? this.deviceAppVersion,
        initialLat: initialLat ?? this.initialLat,
        initialLng: initialLng ?? this.initialLng,
        initialAlt: initialAlt.present ? initialAlt.value : this.initialAlt,
        initialAccuracy: initialAccuracy.present
            ? initialAccuracy.value
            : this.initialAccuracy,
        initialHeading:
            initialHeading.present ? initialHeading.value : this.initialHeading,
        initialSpeed:
            initialSpeed.present ? initialSpeed.value : this.initialSpeed,
      );
  CaseRecord copyWithCompanion(CasesCompanion data) {
    return CaseRecord(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      jurisdiction: data.jurisdiction.present
          ? data.jurisdiction.value
          : this.jurisdiction,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      officerId: data.officerId.present ? data.officerId.value : this.officerId,
      officerName:
          data.officerName.present ? data.officerName.value : this.officerName,
      officerBadge: data.officerBadge.present
          ? data.officerBadge.value
          : this.officerBadge,
      officerAgency: data.officerAgency.present
          ? data.officerAgency.value
          : this.officerAgency,
      officerRank:
          data.officerRank.present ? data.officerRank.value : this.officerRank,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      deviceManufacturer: data.deviceManufacturer.present
          ? data.deviceManufacturer.value
          : this.deviceManufacturer,
      deviceModel:
          data.deviceModel.present ? data.deviceModel.value : this.deviceModel,
      deviceOsVersion: data.deviceOsVersion.present
          ? data.deviceOsVersion.value
          : this.deviceOsVersion,
      deviceAppVersion: data.deviceAppVersion.present
          ? data.deviceAppVersion.value
          : this.deviceAppVersion,
      initialLat:
          data.initialLat.present ? data.initialLat.value : this.initialLat,
      initialLng:
          data.initialLng.present ? data.initialLng.value : this.initialLng,
      initialAlt:
          data.initialAlt.present ? data.initialAlt.value : this.initialAlt,
      initialAccuracy: data.initialAccuracy.present
          ? data.initialAccuracy.value
          : this.initialAccuracy,
      initialHeading: data.initialHeading.present
          ? data.initialHeading.value
          : this.initialHeading,
      initialSpeed: data.initialSpeed.present
          ? data.initialSpeed.value
          : this.initialSpeed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseRecord(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('jurisdiction: $jurisdiction, ')
          ..write('createdAt: $createdAt, ')
          ..write('officerId: $officerId, ')
          ..write('officerName: $officerName, ')
          ..write('officerBadge: $officerBadge, ')
          ..write('officerAgency: $officerAgency, ')
          ..write('officerRank: $officerRank, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceManufacturer: $deviceManufacturer, ')
          ..write('deviceModel: $deviceModel, ')
          ..write('deviceOsVersion: $deviceOsVersion, ')
          ..write('deviceAppVersion: $deviceAppVersion, ')
          ..write('initialLat: $initialLat, ')
          ..write('initialLng: $initialLng, ')
          ..write('initialAlt: $initialAlt, ')
          ..write('initialAccuracy: $initialAccuracy, ')
          ..write('initialHeading: $initialHeading, ')
          ..write('initialSpeed: $initialSpeed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        description,
        jurisdiction,
        createdAt,
        officerId,
        officerName,
        officerBadge,
        officerAgency,
        officerRank,
        deviceId,
        deviceManufacturer,
        deviceModel,
        deviceOsVersion,
        deviceAppVersion,
        initialLat,
        initialLng,
        initialAlt,
        initialAccuracy,
        initialHeading,
        initialSpeed
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseRecord &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.jurisdiction == this.jurisdiction &&
          other.createdAt == this.createdAt &&
          other.officerId == this.officerId &&
          other.officerName == this.officerName &&
          other.officerBadge == this.officerBadge &&
          other.officerAgency == this.officerAgency &&
          other.officerRank == this.officerRank &&
          other.deviceId == this.deviceId &&
          other.deviceManufacturer == this.deviceManufacturer &&
          other.deviceModel == this.deviceModel &&
          other.deviceOsVersion == this.deviceOsVersion &&
          other.deviceAppVersion == this.deviceAppVersion &&
          other.initialLat == this.initialLat &&
          other.initialLng == this.initialLng &&
          other.initialAlt == this.initialAlt &&
          other.initialAccuracy == this.initialAccuracy &&
          other.initialHeading == this.initialHeading &&
          other.initialSpeed == this.initialSpeed);
}

class CasesCompanion extends UpdateCompanion<CaseRecord> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> jurisdiction;
  final Value<int> createdAt;
  final Value<String> officerId;
  final Value<String> officerName;
  final Value<String> officerBadge;
  final Value<String> officerAgency;
  final Value<String> officerRank;
  final Value<String> deviceId;
  final Value<String> deviceManufacturer;
  final Value<String> deviceModel;
  final Value<String> deviceOsVersion;
  final Value<String> deviceAppVersion;
  final Value<double> initialLat;
  final Value<double> initialLng;
  final Value<double?> initialAlt;
  final Value<double?> initialAccuracy;
  final Value<double?> initialHeading;
  final Value<double?> initialSpeed;
  final Value<int> rowid;
  const CasesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.jurisdiction = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.officerId = const Value.absent(),
    this.officerName = const Value.absent(),
    this.officerBadge = const Value.absent(),
    this.officerAgency = const Value.absent(),
    this.officerRank = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceManufacturer = const Value.absent(),
    this.deviceModel = const Value.absent(),
    this.deviceOsVersion = const Value.absent(),
    this.deviceAppVersion = const Value.absent(),
    this.initialLat = const Value.absent(),
    this.initialLng = const Value.absent(),
    this.initialAlt = const Value.absent(),
    this.initialAccuracy = const Value.absent(),
    this.initialHeading = const Value.absent(),
    this.initialSpeed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CasesCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.jurisdiction = const Value.absent(),
    required int createdAt,
    required String officerId,
    required String officerName,
    required String officerBadge,
    required String officerAgency,
    required String officerRank,
    required String deviceId,
    required String deviceManufacturer,
    required String deviceModel,
    required String deviceOsVersion,
    required String deviceAppVersion,
    required double initialLat,
    required double initialLng,
    this.initialAlt = const Value.absent(),
    this.initialAccuracy = const Value.absent(),
    this.initialHeading = const Value.absent(),
    this.initialSpeed = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        createdAt = Value(createdAt),
        officerId = Value(officerId),
        officerName = Value(officerName),
        officerBadge = Value(officerBadge),
        officerAgency = Value(officerAgency),
        officerRank = Value(officerRank),
        deviceId = Value(deviceId),
        deviceManufacturer = Value(deviceManufacturer),
        deviceModel = Value(deviceModel),
        deviceOsVersion = Value(deviceOsVersion),
        deviceAppVersion = Value(deviceAppVersion),
        initialLat = Value(initialLat),
        initialLng = Value(initialLng);
  static Insertable<CaseRecord> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? jurisdiction,
    Expression<int>? createdAt,
    Expression<String>? officerId,
    Expression<String>? officerName,
    Expression<String>? officerBadge,
    Expression<String>? officerAgency,
    Expression<String>? officerRank,
    Expression<String>? deviceId,
    Expression<String>? deviceManufacturer,
    Expression<String>? deviceModel,
    Expression<String>? deviceOsVersion,
    Expression<String>? deviceAppVersion,
    Expression<double>? initialLat,
    Expression<double>? initialLng,
    Expression<double>? initialAlt,
    Expression<double>? initialAccuracy,
    Expression<double>? initialHeading,
    Expression<double>? initialSpeed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (jurisdiction != null) 'jurisdiction': jurisdiction,
      if (createdAt != null) 'created_at': createdAt,
      if (officerId != null) 'officer_id': officerId,
      if (officerName != null) 'officer_name': officerName,
      if (officerBadge != null) 'officer_badge': officerBadge,
      if (officerAgency != null) 'officer_agency': officerAgency,
      if (officerRank != null) 'officer_rank': officerRank,
      if (deviceId != null) 'device_id': deviceId,
      if (deviceManufacturer != null) 'device_manufacturer': deviceManufacturer,
      if (deviceModel != null) 'device_model': deviceModel,
      if (deviceOsVersion != null) 'device_os_version': deviceOsVersion,
      if (deviceAppVersion != null) 'device_app_version': deviceAppVersion,
      if (initialLat != null) 'initial_lat': initialLat,
      if (initialLng != null) 'initial_lng': initialLng,
      if (initialAlt != null) 'initial_alt': initialAlt,
      if (initialAccuracy != null) 'initial_accuracy': initialAccuracy,
      if (initialHeading != null) 'initial_heading': initialHeading,
      if (initialSpeed != null) 'initial_speed': initialSpeed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CasesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String?>? jurisdiction,
      Value<int>? createdAt,
      Value<String>? officerId,
      Value<String>? officerName,
      Value<String>? officerBadge,
      Value<String>? officerAgency,
      Value<String>? officerRank,
      Value<String>? deviceId,
      Value<String>? deviceManufacturer,
      Value<String>? deviceModel,
      Value<String>? deviceOsVersion,
      Value<String>? deviceAppVersion,
      Value<double>? initialLat,
      Value<double>? initialLng,
      Value<double?>? initialAlt,
      Value<double?>? initialAccuracy,
      Value<double?>? initialHeading,
      Value<double?>? initialSpeed,
      Value<int>? rowid}) {
    return CasesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      jurisdiction: jurisdiction ?? this.jurisdiction,
      createdAt: createdAt ?? this.createdAt,
      officerId: officerId ?? this.officerId,
      officerName: officerName ?? this.officerName,
      officerBadge: officerBadge ?? this.officerBadge,
      officerAgency: officerAgency ?? this.officerAgency,
      officerRank: officerRank ?? this.officerRank,
      deviceId: deviceId ?? this.deviceId,
      deviceManufacturer: deviceManufacturer ?? this.deviceManufacturer,
      deviceModel: deviceModel ?? this.deviceModel,
      deviceOsVersion: deviceOsVersion ?? this.deviceOsVersion,
      deviceAppVersion: deviceAppVersion ?? this.deviceAppVersion,
      initialLat: initialLat ?? this.initialLat,
      initialLng: initialLng ?? this.initialLng,
      initialAlt: initialAlt ?? this.initialAlt,
      initialAccuracy: initialAccuracy ?? this.initialAccuracy,
      initialHeading: initialHeading ?? this.initialHeading,
      initialSpeed: initialSpeed ?? this.initialSpeed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (jurisdiction.present) {
      map['jurisdiction'] = Variable<String>(jurisdiction.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (officerId.present) {
      map['officer_id'] = Variable<String>(officerId.value);
    }
    if (officerName.present) {
      map['officer_name'] = Variable<String>(officerName.value);
    }
    if (officerBadge.present) {
      map['officer_badge'] = Variable<String>(officerBadge.value);
    }
    if (officerAgency.present) {
      map['officer_agency'] = Variable<String>(officerAgency.value);
    }
    if (officerRank.present) {
      map['officer_rank'] = Variable<String>(officerRank.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (deviceManufacturer.present) {
      map['device_manufacturer'] = Variable<String>(deviceManufacturer.value);
    }
    if (deviceModel.present) {
      map['device_model'] = Variable<String>(deviceModel.value);
    }
    if (deviceOsVersion.present) {
      map['device_os_version'] = Variable<String>(deviceOsVersion.value);
    }
    if (deviceAppVersion.present) {
      map['device_app_version'] = Variable<String>(deviceAppVersion.value);
    }
    if (initialLat.present) {
      map['initial_lat'] = Variable<double>(initialLat.value);
    }
    if (initialLng.present) {
      map['initial_lng'] = Variable<double>(initialLng.value);
    }
    if (initialAlt.present) {
      map['initial_alt'] = Variable<double>(initialAlt.value);
    }
    if (initialAccuracy.present) {
      map['initial_accuracy'] = Variable<double>(initialAccuracy.value);
    }
    if (initialHeading.present) {
      map['initial_heading'] = Variable<double>(initialHeading.value);
    }
    if (initialSpeed.present) {
      map['initial_speed'] = Variable<double>(initialSpeed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CasesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('jurisdiction: $jurisdiction, ')
          ..write('createdAt: $createdAt, ')
          ..write('officerId: $officerId, ')
          ..write('officerName: $officerName, ')
          ..write('officerBadge: $officerBadge, ')
          ..write('officerAgency: $officerAgency, ')
          ..write('officerRank: $officerRank, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceManufacturer: $deviceManufacturer, ')
          ..write('deviceModel: $deviceModel, ')
          ..write('deviceOsVersion: $deviceOsVersion, ')
          ..write('deviceAppVersion: $deviceAppVersion, ')
          ..write('initialLat: $initialLat, ')
          ..write('initialLng: $initialLng, ')
          ..write('initialAlt: $initialAlt, ')
          ..write('initialAccuracy: $initialAccuracy, ')
          ..write('initialHeading: $initialHeading, ')
          ..write('initialSpeed: $initialSpeed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordingSessionsTable extends RecordingSessions
    with TableInfo<$RecordingSessionsTable, RecordingSessionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
      'started_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startedByMeta =
      const VerificationMeta('startedBy');
  @override
  late final GeneratedColumn<String> startedBy = GeneratedColumn<String>(
      'started_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<int> endedAt = GeneratedColumn<int>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _endedByMeta =
      const VerificationMeta('endedBy');
  @override
  late final GeneratedColumn<String> endedBy = GeneratedColumn<String>(
      'ended_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, caseId, startedAt, startedBy, endedAt, endedBy];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recording_sessions';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecordingSessionRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('started_by')) {
      context.handle(_startedByMeta,
          startedBy.isAcceptableOrUnknown(data['started_by']!, _startedByMeta));
    } else if (isInserting) {
      context.missing(_startedByMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('ended_by')) {
      context.handle(_endedByMeta,
          endedBy.isAcceptableOrUnknown(data['ended_by']!, _endedByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordingSessionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordingSessionRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}started_at'])!,
      startedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}started_by'])!,
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ended_at']),
      endedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ended_by']),
    );
  }

  @override
  $RecordingSessionsTable createAlias(String alias) {
    return $RecordingSessionsTable(attachedDatabase, alias);
  }
}

class RecordingSessionRecord extends DataClass
    implements Insertable<RecordingSessionRecord> {
  final String id;
  final String caseId;
  final int startedAt;
  final String startedBy;
  final int? endedAt;
  final String? endedBy;
  const RecordingSessionRecord(
      {required this.id,
      required this.caseId,
      required this.startedAt,
      required this.startedBy,
      this.endedAt,
      this.endedBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['started_at'] = Variable<int>(startedAt);
    map['started_by'] = Variable<String>(startedBy);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<int>(endedAt);
    }
    if (!nullToAbsent || endedBy != null) {
      map['ended_by'] = Variable<String>(endedBy);
    }
    return map;
  }

  RecordingSessionsCompanion toCompanion(bool nullToAbsent) {
    return RecordingSessionsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      startedAt: Value(startedAt),
      startedBy: Value(startedBy),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      endedBy: endedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(endedBy),
    );
  }

  factory RecordingSessionRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordingSessionRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      startedAt: serializer.fromJson<int>(json['startedAt']),
      startedBy: serializer.fromJson<String>(json['startedBy']),
      endedAt: serializer.fromJson<int?>(json['endedAt']),
      endedBy: serializer.fromJson<String?>(json['endedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'startedAt': serializer.toJson<int>(startedAt),
      'startedBy': serializer.toJson<String>(startedBy),
      'endedAt': serializer.toJson<int?>(endedAt),
      'endedBy': serializer.toJson<String?>(endedBy),
    };
  }

  RecordingSessionRecord copyWith(
          {String? id,
          String? caseId,
          int? startedAt,
          String? startedBy,
          Value<int?> endedAt = const Value.absent(),
          Value<String?> endedBy = const Value.absent()}) =>
      RecordingSessionRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        startedAt: startedAt ?? this.startedAt,
        startedBy: startedBy ?? this.startedBy,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        endedBy: endedBy.present ? endedBy.value : this.endedBy,
      );
  RecordingSessionRecord copyWithCompanion(RecordingSessionsCompanion data) {
    return RecordingSessionRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      startedBy: data.startedBy.present ? data.startedBy.value : this.startedBy,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      endedBy: data.endedBy.present ? data.endedBy.value : this.endedBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordingSessionRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('startedBy: $startedBy, ')
          ..write('endedAt: $endedAt, ')
          ..write('endedBy: $endedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, caseId, startedAt, startedBy, endedAt, endedBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordingSessionRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.startedAt == this.startedAt &&
          other.startedBy == this.startedBy &&
          other.endedAt == this.endedAt &&
          other.endedBy == this.endedBy);
}

class RecordingSessionsCompanion
    extends UpdateCompanion<RecordingSessionRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<int> startedAt;
  final Value<String> startedBy;
  final Value<int?> endedAt;
  final Value<String?> endedBy;
  final Value<int> rowid;
  const RecordingSessionsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.startedBy = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.endedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordingSessionsCompanion.insert({
    required String id,
    required String caseId,
    required int startedAt,
    required String startedBy,
    this.endedAt = const Value.absent(),
    this.endedBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        startedAt = Value(startedAt),
        startedBy = Value(startedBy);
  static Insertable<RecordingSessionRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<int>? startedAt,
    Expression<String>? startedBy,
    Expression<int>? endedAt,
    Expression<String>? endedBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (startedAt != null) 'started_at': startedAt,
      if (startedBy != null) 'started_by': startedBy,
      if (endedAt != null) 'ended_at': endedAt,
      if (endedBy != null) 'ended_by': endedBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordingSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<int>? startedAt,
      Value<String>? startedBy,
      Value<int?>? endedAt,
      Value<String?>? endedBy,
      Value<int>? rowid}) {
    return RecordingSessionsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      startedAt: startedAt ?? this.startedAt,
      startedBy: startedBy ?? this.startedBy,
      endedAt: endedAt ?? this.endedAt,
      endedBy: endedBy ?? this.endedBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (startedBy.present) {
      map['started_by'] = Variable<String>(startedBy.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<int>(endedAt.value);
    }
    if (endedBy.present) {
      map['ended_by'] = Variable<String>(endedBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('startedBy: $startedBy, ')
          ..write('endedAt: $endedAt, ')
          ..write('endedBy: $endedBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VideoSegmentsTable extends VideoSegments
    with TableInfo<$VideoSegmentsTable, VideoSegmentRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideoSegmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
      'sha256', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startOffsetMsMeta =
      const VerificationMeta('startOffsetMs');
  @override
  late final GeneratedColumn<int> startOffsetMs = GeneratedColumn<int>(
      'start_offset_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endOffsetMsMeta =
      const VerificationMeta('endOffsetMs');
  @override
  late final GeneratedColumn<int> endOffsetMs = GeneratedColumn<int>(
      'end_offset_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _finalizedMeta =
      const VerificationMeta('finalized');
  @override
  late final GeneratedColumn<bool> finalized = GeneratedColumn<bool>(
      'finalized', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("finalized" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _abruptMeta = const VerificationMeta('abrupt');
  @override
  late final GeneratedColumn<bool> abrupt = GeneratedColumn<bool>(
      'abrupt', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("abrupt" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        filePath,
        sha256,
        sizeBytes,
        startTime,
        endTime,
        startOffsetMs,
        endOffsetMs,
        finalized,
        abrupt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'video_segments';
  @override
  VerificationContext validateIntegrity(Insertable<VideoSegmentRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(_sha256Meta,
          sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta));
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('start_offset_ms')) {
      context.handle(
          _startOffsetMsMeta,
          startOffsetMs.isAcceptableOrUnknown(
              data['start_offset_ms']!, _startOffsetMsMeta));
    } else if (isInserting) {
      context.missing(_startOffsetMsMeta);
    }
    if (data.containsKey('end_offset_ms')) {
      context.handle(
          _endOffsetMsMeta,
          endOffsetMs.isAcceptableOrUnknown(
              data['end_offset_ms']!, _endOffsetMsMeta));
    } else if (isInserting) {
      context.missing(_endOffsetMsMeta);
    }
    if (data.containsKey('finalized')) {
      context.handle(_finalizedMeta,
          finalized.isAcceptableOrUnknown(data['finalized']!, _finalizedMeta));
    }
    if (data.containsKey('abrupt')) {
      context.handle(_abruptMeta,
          abrupt.isAcceptableOrUnknown(data['abrupt']!, _abruptMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VideoSegmentRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideoSegmentRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      sha256: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha256'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
      startOffsetMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_offset_ms'])!,
      endOffsetMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_offset_ms'])!,
      finalized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}finalized'])!,
      abrupt: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}abrupt'])!,
    );
  }

  @override
  $VideoSegmentsTable createAlias(String alias) {
    return $VideoSegmentsTable(attachedDatabase, alias);
  }
}

class VideoSegmentRecord extends DataClass
    implements Insertable<VideoSegmentRecord> {
  final String id;
  final String sessionId;
  final String filePath;
  final String sha256;
  final int sizeBytes;
  final int startTime;
  final int endTime;
  final int startOffsetMs;
  final int endOffsetMs;
  final bool finalized;
  final bool abrupt;
  const VideoSegmentRecord(
      {required this.id,
      required this.sessionId,
      required this.filePath,
      required this.sha256,
      required this.sizeBytes,
      required this.startTime,
      required this.endTime,
      required this.startOffsetMs,
      required this.endOffsetMs,
      required this.finalized,
      required this.abrupt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['file_path'] = Variable<String>(filePath);
    map['sha256'] = Variable<String>(sha256);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['start_offset_ms'] = Variable<int>(startOffsetMs);
    map['end_offset_ms'] = Variable<int>(endOffsetMs);
    map['finalized'] = Variable<bool>(finalized);
    map['abrupt'] = Variable<bool>(abrupt);
    return map;
  }

  VideoSegmentsCompanion toCompanion(bool nullToAbsent) {
    return VideoSegmentsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      filePath: Value(filePath),
      sha256: Value(sha256),
      sizeBytes: Value(sizeBytes),
      startTime: Value(startTime),
      endTime: Value(endTime),
      startOffsetMs: Value(startOffsetMs),
      endOffsetMs: Value(endOffsetMs),
      finalized: Value(finalized),
      abrupt: Value(abrupt),
    );
  }

  factory VideoSegmentRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideoSegmentRecord(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      sha256: serializer.fromJson<String>(json['sha256']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      startOffsetMs: serializer.fromJson<int>(json['startOffsetMs']),
      endOffsetMs: serializer.fromJson<int>(json['endOffsetMs']),
      finalized: serializer.fromJson<bool>(json['finalized']),
      abrupt: serializer.fromJson<bool>(json['abrupt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'filePath': serializer.toJson<String>(filePath),
      'sha256': serializer.toJson<String>(sha256),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'startOffsetMs': serializer.toJson<int>(startOffsetMs),
      'endOffsetMs': serializer.toJson<int>(endOffsetMs),
      'finalized': serializer.toJson<bool>(finalized),
      'abrupt': serializer.toJson<bool>(abrupt),
    };
  }

  VideoSegmentRecord copyWith(
          {String? id,
          String? sessionId,
          String? filePath,
          String? sha256,
          int? sizeBytes,
          int? startTime,
          int? endTime,
          int? startOffsetMs,
          int? endOffsetMs,
          bool? finalized,
          bool? abrupt}) =>
      VideoSegmentRecord(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        filePath: filePath ?? this.filePath,
        sha256: sha256 ?? this.sha256,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        startOffsetMs: startOffsetMs ?? this.startOffsetMs,
        endOffsetMs: endOffsetMs ?? this.endOffsetMs,
        finalized: finalized ?? this.finalized,
        abrupt: abrupt ?? this.abrupt,
      );
  VideoSegmentRecord copyWithCompanion(VideoSegmentsCompanion data) {
    return VideoSegmentRecord(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      startOffsetMs: data.startOffsetMs.present
          ? data.startOffsetMs.value
          : this.startOffsetMs,
      endOffsetMs:
          data.endOffsetMs.present ? data.endOffsetMs.value : this.endOffsetMs,
      finalized: data.finalized.present ? data.finalized.value : this.finalized,
      abrupt: data.abrupt.present ? data.abrupt.value : this.abrupt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideoSegmentRecord(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('startOffsetMs: $startOffsetMs, ')
          ..write('endOffsetMs: $endOffsetMs, ')
          ..write('finalized: $finalized, ')
          ..write('abrupt: $abrupt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, filePath, sha256, sizeBytes,
      startTime, endTime, startOffsetMs, endOffsetMs, finalized, abrupt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoSegmentRecord &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.filePath == this.filePath &&
          other.sha256 == this.sha256 &&
          other.sizeBytes == this.sizeBytes &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.startOffsetMs == this.startOffsetMs &&
          other.endOffsetMs == this.endOffsetMs &&
          other.finalized == this.finalized &&
          other.abrupt == this.abrupt);
}

class VideoSegmentsCompanion extends UpdateCompanion<VideoSegmentRecord> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> filePath;
  final Value<String> sha256;
  final Value<int> sizeBytes;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<int> startOffsetMs;
  final Value<int> endOffsetMs;
  final Value<bool> finalized;
  final Value<bool> abrupt;
  final Value<int> rowid;
  const VideoSegmentsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.startOffsetMs = const Value.absent(),
    this.endOffsetMs = const Value.absent(),
    this.finalized = const Value.absent(),
    this.abrupt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VideoSegmentsCompanion.insert({
    required String id,
    required String sessionId,
    required String filePath,
    required String sha256,
    required int sizeBytes,
    required int startTime,
    required int endTime,
    required int startOffsetMs,
    required int endOffsetMs,
    this.finalized = const Value.absent(),
    this.abrupt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionId = Value(sessionId),
        filePath = Value(filePath),
        sha256 = Value(sha256),
        sizeBytes = Value(sizeBytes),
        startTime = Value(startTime),
        endTime = Value(endTime),
        startOffsetMs = Value(startOffsetMs),
        endOffsetMs = Value(endOffsetMs);
  static Insertable<VideoSegmentRecord> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? filePath,
    Expression<String>? sha256,
    Expression<int>? sizeBytes,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<int>? startOffsetMs,
    Expression<int>? endOffsetMs,
    Expression<bool>? finalized,
    Expression<bool>? abrupt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (filePath != null) 'file_path': filePath,
      if (sha256 != null) 'sha256': sha256,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (startOffsetMs != null) 'start_offset_ms': startOffsetMs,
      if (endOffsetMs != null) 'end_offset_ms': endOffsetMs,
      if (finalized != null) 'finalized': finalized,
      if (abrupt != null) 'abrupt': abrupt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VideoSegmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionId,
      Value<String>? filePath,
      Value<String>? sha256,
      Value<int>? sizeBytes,
      Value<int>? startTime,
      Value<int>? endTime,
      Value<int>? startOffsetMs,
      Value<int>? endOffsetMs,
      Value<bool>? finalized,
      Value<bool>? abrupt,
      Value<int>? rowid}) {
    return VideoSegmentsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      filePath: filePath ?? this.filePath,
      sha256: sha256 ?? this.sha256,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startOffsetMs: startOffsetMs ?? this.startOffsetMs,
      endOffsetMs: endOffsetMs ?? this.endOffsetMs,
      finalized: finalized ?? this.finalized,
      abrupt: abrupt ?? this.abrupt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (startOffsetMs.present) {
      map['start_offset_ms'] = Variable<int>(startOffsetMs.value);
    }
    if (endOffsetMs.present) {
      map['end_offset_ms'] = Variable<int>(endOffsetMs.value);
    }
    if (finalized.present) {
      map['finalized'] = Variable<bool>(finalized.value);
    }
    if (abrupt.present) {
      map['abrupt'] = Variable<bool>(abrupt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideoSegmentsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('startOffsetMs: $startOffsetMs, ')
          ..write('endOffsetMs: $endOffsetMs, ')
          ..write('finalized: $finalized, ')
          ..write('abrupt: $abrupt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EvidenceItemsTable extends EvidenceItems
    with TableInfo<$EvidenceItemsTable, EvidenceItemRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidenceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _capturedByMeta =
      const VerificationMeta('capturedBy');
  @override
  late final GeneratedColumn<String> capturedBy = GeneratedColumn<String>(
      'captured_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _capturedAtMeta =
      const VerificationMeta('capturedAt');
  @override
  late final GeneratedColumn<int> capturedAt = GeneratedColumn<int>(
      'captured_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _videoOffsetMsMeta =
      const VerificationMeta('videoOffsetMs');
  @override
  late final GeneratedColumn<int> videoOffsetMs = GeneratedColumn<int>(
      'video_offset_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _altitudeMeta =
      const VerificationMeta('altitude');
  @override
  late final GeneratedColumn<double> altitude = GeneratedColumn<double>(
      'altitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _accuracyMeta =
      const VerificationMeta('accuracy');
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
      'accuracy', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _headingMeta =
      const VerificationMeta('heading');
  @override
  late final GeneratedColumn<double> heading = GeneratedColumn<double>(
      'heading', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
      'speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
      'sha256', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _durationMsMeta =
      const VerificationMeta('durationMs');
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
      'duration_ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _noteTextMeta =
      const VerificationMeta('noteText');
  @override
  late final GeneratedColumn<String> noteText = GeneratedColumn<String>(
      'note_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffsetMs,
        latitude,
        longitude,
        altitude,
        accuracy,
        heading,
        speed,
        type,
        filePath,
        sha256,
        sizeBytes,
        mimeType,
        width,
        height,
        durationMs,
        noteText
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evidence_items';
  @override
  VerificationContext validateIntegrity(Insertable<EvidenceItemRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('captured_by')) {
      context.handle(
          _capturedByMeta,
          capturedBy.isAcceptableOrUnknown(
              data['captured_by']!, _capturedByMeta));
    } else if (isInserting) {
      context.missing(_capturedByMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
          _capturedAtMeta,
          capturedAt.isAcceptableOrUnknown(
              data['captured_at']!, _capturedAtMeta));
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('video_offset_ms')) {
      context.handle(
          _videoOffsetMsMeta,
          videoOffsetMs.isAcceptableOrUnknown(
              data['video_offset_ms']!, _videoOffsetMsMeta));
    } else if (isInserting) {
      context.missing(_videoOffsetMsMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('altitude')) {
      context.handle(_altitudeMeta,
          altitude.isAcceptableOrUnknown(data['altitude']!, _altitudeMeta));
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    }
    if (data.containsKey('heading')) {
      context.handle(_headingMeta,
          heading.isAcceptableOrUnknown(data['heading']!, _headingMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    }
    if (data.containsKey('sha256')) {
      context.handle(_sha256Meta,
          sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta));
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
          _durationMsMeta,
          durationMs.isAcceptableOrUnknown(
              data['duration_ms']!, _durationMsMeta));
    }
    if (data.containsKey('note_text')) {
      context.handle(_noteTextMeta,
          noteText.isAcceptableOrUnknown(data['note_text']!, _noteTextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EvidenceItemRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvidenceItemRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      capturedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}captured_by'])!,
      capturedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}captured_at'])!,
      videoOffsetMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_offset_ms'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      altitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}altitude']),
      accuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}accuracy']),
      heading: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}heading']),
      speed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}speed']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path']),
      sha256: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha256']),
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes']),
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type']),
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height']),
      durationMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_ms']),
      noteText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_text']),
    );
  }

  @override
  $EvidenceItemsTable createAlias(String alias) {
    return $EvidenceItemsTable(attachedDatabase, alias);
  }
}

class EvidenceItemRecord extends DataClass
    implements Insertable<EvidenceItemRecord> {
  final String id;
  final String caseId;
  final String sessionId;
  final String capturedBy;
  final int capturedAt;
  final int videoOffsetMs;
  final double latitude;
  final double longitude;
  final double? altitude;
  final double? accuracy;
  final double? heading;
  final double? speed;
  final String type;
  final String? filePath;
  final String? sha256;
  final int? sizeBytes;
  final String? mimeType;
  final int? width;
  final int? height;
  final int? durationMs;
  final String? noteText;
  const EvidenceItemRecord(
      {required this.id,
      required this.caseId,
      required this.sessionId,
      required this.capturedBy,
      required this.capturedAt,
      required this.videoOffsetMs,
      required this.latitude,
      required this.longitude,
      this.altitude,
      this.accuracy,
      this.heading,
      this.speed,
      required this.type,
      this.filePath,
      this.sha256,
      this.sizeBytes,
      this.mimeType,
      this.width,
      this.height,
      this.durationMs,
      this.noteText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['session_id'] = Variable<String>(sessionId);
    map['captured_by'] = Variable<String>(capturedBy);
    map['captured_at'] = Variable<int>(capturedAt);
    map['video_offset_ms'] = Variable<int>(videoOffsetMs);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || altitude != null) {
      map['altitude'] = Variable<double>(altitude);
    }
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double>(accuracy);
    }
    if (!nullToAbsent || heading != null) {
      map['heading'] = Variable<double>(heading);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || sha256 != null) {
      map['sha256'] = Variable<String>(sha256);
    }
    if (!nullToAbsent || sizeBytes != null) {
      map['size_bytes'] = Variable<int>(sizeBytes);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    if (!nullToAbsent || noteText != null) {
      map['note_text'] = Variable<String>(noteText);
    }
    return map;
  }

  EvidenceItemsCompanion toCompanion(bool nullToAbsent) {
    return EvidenceItemsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      sessionId: Value(sessionId),
      capturedBy: Value(capturedBy),
      capturedAt: Value(capturedAt),
      videoOffsetMs: Value(videoOffsetMs),
      latitude: Value(latitude),
      longitude: Value(longitude),
      altitude: altitude == null && nullToAbsent
          ? const Value.absent()
          : Value(altitude),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      heading: heading == null && nullToAbsent
          ? const Value.absent()
          : Value(heading),
      speed:
          speed == null && nullToAbsent ? const Value.absent() : Value(speed),
      type: Value(type),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      sha256:
          sha256 == null && nullToAbsent ? const Value.absent() : Value(sha256),
      sizeBytes: sizeBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(sizeBytes),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      width:
          width == null && nullToAbsent ? const Value.absent() : Value(width),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
      noteText: noteText == null && nullToAbsent
          ? const Value.absent()
          : Value(noteText),
    );
  }

  factory EvidenceItemRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EvidenceItemRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      capturedBy: serializer.fromJson<String>(json['capturedBy']),
      capturedAt: serializer.fromJson<int>(json['capturedAt']),
      videoOffsetMs: serializer.fromJson<int>(json['videoOffsetMs']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      altitude: serializer.fromJson<double?>(json['altitude']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      heading: serializer.fromJson<double?>(json['heading']),
      speed: serializer.fromJson<double?>(json['speed']),
      type: serializer.fromJson<String>(json['type']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      sha256: serializer.fromJson<String?>(json['sha256']),
      sizeBytes: serializer.fromJson<int?>(json['sizeBytes']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
      noteText: serializer.fromJson<String?>(json['noteText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'sessionId': serializer.toJson<String>(sessionId),
      'capturedBy': serializer.toJson<String>(capturedBy),
      'capturedAt': serializer.toJson<int>(capturedAt),
      'videoOffsetMs': serializer.toJson<int>(videoOffsetMs),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'altitude': serializer.toJson<double?>(altitude),
      'accuracy': serializer.toJson<double?>(accuracy),
      'heading': serializer.toJson<double?>(heading),
      'speed': serializer.toJson<double?>(speed),
      'type': serializer.toJson<String>(type),
      'filePath': serializer.toJson<String?>(filePath),
      'sha256': serializer.toJson<String?>(sha256),
      'sizeBytes': serializer.toJson<int?>(sizeBytes),
      'mimeType': serializer.toJson<String?>(mimeType),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'durationMs': serializer.toJson<int?>(durationMs),
      'noteText': serializer.toJson<String?>(noteText),
    };
  }

  EvidenceItemRecord copyWith(
          {String? id,
          String? caseId,
          String? sessionId,
          String? capturedBy,
          int? capturedAt,
          int? videoOffsetMs,
          double? latitude,
          double? longitude,
          Value<double?> altitude = const Value.absent(),
          Value<double?> accuracy = const Value.absent(),
          Value<double?> heading = const Value.absent(),
          Value<double?> speed = const Value.absent(),
          String? type,
          Value<String?> filePath = const Value.absent(),
          Value<String?> sha256 = const Value.absent(),
          Value<int?> sizeBytes = const Value.absent(),
          Value<String?> mimeType = const Value.absent(),
          Value<int?> width = const Value.absent(),
          Value<int?> height = const Value.absent(),
          Value<int?> durationMs = const Value.absent(),
          Value<String?> noteText = const Value.absent()}) =>
      EvidenceItemRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        sessionId: sessionId ?? this.sessionId,
        capturedBy: capturedBy ?? this.capturedBy,
        capturedAt: capturedAt ?? this.capturedAt,
        videoOffsetMs: videoOffsetMs ?? this.videoOffsetMs,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        altitude: altitude.present ? altitude.value : this.altitude,
        accuracy: accuracy.present ? accuracy.value : this.accuracy,
        heading: heading.present ? heading.value : this.heading,
        speed: speed.present ? speed.value : this.speed,
        type: type ?? this.type,
        filePath: filePath.present ? filePath.value : this.filePath,
        sha256: sha256.present ? sha256.value : this.sha256,
        sizeBytes: sizeBytes.present ? sizeBytes.value : this.sizeBytes,
        mimeType: mimeType.present ? mimeType.value : this.mimeType,
        width: width.present ? width.value : this.width,
        height: height.present ? height.value : this.height,
        durationMs: durationMs.present ? durationMs.value : this.durationMs,
        noteText: noteText.present ? noteText.value : this.noteText,
      );
  EvidenceItemRecord copyWithCompanion(EvidenceItemsCompanion data) {
    return EvidenceItemRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      capturedBy:
          data.capturedBy.present ? data.capturedBy.value : this.capturedBy,
      capturedAt:
          data.capturedAt.present ? data.capturedAt.value : this.capturedAt,
      videoOffsetMs: data.videoOffsetMs.present
          ? data.videoOffsetMs.value
          : this.videoOffsetMs,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      altitude: data.altitude.present ? data.altitude.value : this.altitude,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      heading: data.heading.present ? data.heading.value : this.heading,
      speed: data.speed.present ? data.speed.value : this.speed,
      type: data.type.present ? data.type.value : this.type,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      durationMs:
          data.durationMs.present ? data.durationMs.value : this.durationMs,
      noteText: data.noteText.present ? data.noteText.value : this.noteText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvidenceItemRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('capturedBy: $capturedBy, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('videoOffsetMs: $videoOffsetMs, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitude: $altitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('heading: $heading, ')
          ..write('speed: $speed, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationMs: $durationMs, ')
          ..write('noteText: $noteText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        caseId,
        sessionId,
        capturedBy,
        capturedAt,
        videoOffsetMs,
        latitude,
        longitude,
        altitude,
        accuracy,
        heading,
        speed,
        type,
        filePath,
        sha256,
        sizeBytes,
        mimeType,
        width,
        height,
        durationMs,
        noteText
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvidenceItemRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.sessionId == this.sessionId &&
          other.capturedBy == this.capturedBy &&
          other.capturedAt == this.capturedAt &&
          other.videoOffsetMs == this.videoOffsetMs &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.altitude == this.altitude &&
          other.accuracy == this.accuracy &&
          other.heading == this.heading &&
          other.speed == this.speed &&
          other.type == this.type &&
          other.filePath == this.filePath &&
          other.sha256 == this.sha256 &&
          other.sizeBytes == this.sizeBytes &&
          other.mimeType == this.mimeType &&
          other.width == this.width &&
          other.height == this.height &&
          other.durationMs == this.durationMs &&
          other.noteText == this.noteText);
}

class EvidenceItemsCompanion extends UpdateCompanion<EvidenceItemRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> sessionId;
  final Value<String> capturedBy;
  final Value<int> capturedAt;
  final Value<int> videoOffsetMs;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> altitude;
  final Value<double?> accuracy;
  final Value<double?> heading;
  final Value<double?> speed;
  final Value<String> type;
  final Value<String?> filePath;
  final Value<String?> sha256;
  final Value<int?> sizeBytes;
  final Value<String?> mimeType;
  final Value<int?> width;
  final Value<int?> height;
  final Value<int?> durationMs;
  final Value<String?> noteText;
  final Value<int> rowid;
  const EvidenceItemsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.capturedBy = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.videoOffsetMs = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.altitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.heading = const Value.absent(),
    this.speed = const Value.absent(),
    this.type = const Value.absent(),
    this.filePath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.noteText = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EvidenceItemsCompanion.insert({
    required String id,
    required String caseId,
    required String sessionId,
    required String capturedBy,
    required int capturedAt,
    required int videoOffsetMs,
    required double latitude,
    required double longitude,
    this.altitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.heading = const Value.absent(),
    this.speed = const Value.absent(),
    required String type,
    this.filePath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.noteText = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        sessionId = Value(sessionId),
        capturedBy = Value(capturedBy),
        capturedAt = Value(capturedAt),
        videoOffsetMs = Value(videoOffsetMs),
        latitude = Value(latitude),
        longitude = Value(longitude),
        type = Value(type);
  static Insertable<EvidenceItemRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? sessionId,
    Expression<String>? capturedBy,
    Expression<int>? capturedAt,
    Expression<int>? videoOffsetMs,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? altitude,
    Expression<double>? accuracy,
    Expression<double>? heading,
    Expression<double>? speed,
    Expression<String>? type,
    Expression<String>? filePath,
    Expression<String>? sha256,
    Expression<int>? sizeBytes,
    Expression<String>? mimeType,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? durationMs,
    Expression<String>? noteText,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (sessionId != null) 'session_id': sessionId,
      if (capturedBy != null) 'captured_by': capturedBy,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (videoOffsetMs != null) 'video_offset_ms': videoOffsetMs,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (altitude != null) 'altitude': altitude,
      if (accuracy != null) 'accuracy': accuracy,
      if (heading != null) 'heading': heading,
      if (speed != null) 'speed': speed,
      if (type != null) 'type': type,
      if (filePath != null) 'file_path': filePath,
      if (sha256 != null) 'sha256': sha256,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (mimeType != null) 'mime_type': mimeType,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (durationMs != null) 'duration_ms': durationMs,
      if (noteText != null) 'note_text': noteText,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EvidenceItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<String>? sessionId,
      Value<String>? capturedBy,
      Value<int>? capturedAt,
      Value<int>? videoOffsetMs,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<double?>? altitude,
      Value<double?>? accuracy,
      Value<double?>? heading,
      Value<double?>? speed,
      Value<String>? type,
      Value<String?>? filePath,
      Value<String?>? sha256,
      Value<int?>? sizeBytes,
      Value<String?>? mimeType,
      Value<int?>? width,
      Value<int?>? height,
      Value<int?>? durationMs,
      Value<String?>? noteText,
      Value<int>? rowid}) {
    return EvidenceItemsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      sessionId: sessionId ?? this.sessionId,
      capturedBy: capturedBy ?? this.capturedBy,
      capturedAt: capturedAt ?? this.capturedAt,
      videoOffsetMs: videoOffsetMs ?? this.videoOffsetMs,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitude: altitude ?? this.altitude,
      accuracy: accuracy ?? this.accuracy,
      heading: heading ?? this.heading,
      speed: speed ?? this.speed,
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      sha256: sha256 ?? this.sha256,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      mimeType: mimeType ?? this.mimeType,
      width: width ?? this.width,
      height: height ?? this.height,
      durationMs: durationMs ?? this.durationMs,
      noteText: noteText ?? this.noteText,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (capturedBy.present) {
      map['captured_by'] = Variable<String>(capturedBy.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<int>(capturedAt.value);
    }
    if (videoOffsetMs.present) {
      map['video_offset_ms'] = Variable<int>(videoOffsetMs.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (altitude.present) {
      map['altitude'] = Variable<double>(altitude.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (heading.present) {
      map['heading'] = Variable<double>(heading.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (noteText.present) {
      map['note_text'] = Variable<String>(noteText.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidenceItemsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('capturedBy: $capturedBy, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('videoOffsetMs: $videoOffsetMs, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitude: $altitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('heading: $heading, ')
          ..write('speed: $speed, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationMs: $durationMs, ')
          ..write('noteText: $noteText, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DetectionsTable extends Detections
    with TableInfo<$DetectionsTable, DetectionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdMeta =
      const VerificationMeta('evidenceId');
  @override
  late final GeneratedColumn<String> evidenceId = GeneratedColumn<String>(
      'evidence_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _confidenceMeta =
      const VerificationMeta('confidence');
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
      'confidence', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bboxLeftMeta =
      const VerificationMeta('bboxLeft');
  @override
  late final GeneratedColumn<double> bboxLeft = GeneratedColumn<double>(
      'bbox_left', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bboxTopMeta =
      const VerificationMeta('bboxTop');
  @override
  late final GeneratedColumn<double> bboxTop = GeneratedColumn<double>(
      'bbox_top', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bboxRightMeta =
      const VerificationMeta('bboxRight');
  @override
  late final GeneratedColumn<double> bboxRight = GeneratedColumn<double>(
      'bbox_right', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bboxBottomMeta =
      const VerificationMeta('bboxBottom');
  @override
  late final GeneratedColumn<double> bboxBottom = GeneratedColumn<double>(
      'bbox_bottom', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bboxNormalizedMeta =
      const VerificationMeta('bboxNormalized');
  @override
  late final GeneratedColumn<bool> bboxNormalized = GeneratedColumn<bool>(
      'bbox_normalized', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("bbox_normalized" IN (0, 1))'));
  static const VerificationMeta _detectedAtMeta =
      const VerificationMeta('detectedAt');
  @override
  late final GeneratedColumn<int> detectedAt = GeneratedColumn<int>(
      'detected_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _videoOffsetMsMeta =
      const VerificationMeta('videoOffsetMs');
  @override
  late final GeneratedColumn<int> videoOffsetMs = GeneratedColumn<int>(
      'video_offset_ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        caseId,
        sessionId,
        evidenceId,
        category,
        confidence,
        bboxLeft,
        bboxTop,
        bboxRight,
        bboxBottom,
        bboxNormalized,
        detectedAt,
        videoOffsetMs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detections';
  @override
  VerificationContext validateIntegrity(Insertable<DetectionRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('evidence_id')) {
      context.handle(
          _evidenceIdMeta,
          evidenceId.isAcceptableOrUnknown(
              data['evidence_id']!, _evidenceIdMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
          _confidenceMeta,
          confidence.isAcceptableOrUnknown(
              data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('bbox_left')) {
      context.handle(_bboxLeftMeta,
          bboxLeft.isAcceptableOrUnknown(data['bbox_left']!, _bboxLeftMeta));
    } else if (isInserting) {
      context.missing(_bboxLeftMeta);
    }
    if (data.containsKey('bbox_top')) {
      context.handle(_bboxTopMeta,
          bboxTop.isAcceptableOrUnknown(data['bbox_top']!, _bboxTopMeta));
    } else if (isInserting) {
      context.missing(_bboxTopMeta);
    }
    if (data.containsKey('bbox_right')) {
      context.handle(_bboxRightMeta,
          bboxRight.isAcceptableOrUnknown(data['bbox_right']!, _bboxRightMeta));
    } else if (isInserting) {
      context.missing(_bboxRightMeta);
    }
    if (data.containsKey('bbox_bottom')) {
      context.handle(
          _bboxBottomMeta,
          bboxBottom.isAcceptableOrUnknown(
              data['bbox_bottom']!, _bboxBottomMeta));
    } else if (isInserting) {
      context.missing(_bboxBottomMeta);
    }
    if (data.containsKey('bbox_normalized')) {
      context.handle(
          _bboxNormalizedMeta,
          bboxNormalized.isAcceptableOrUnknown(
              data['bbox_normalized']!, _bboxNormalizedMeta));
    } else if (isInserting) {
      context.missing(_bboxNormalizedMeta);
    }
    if (data.containsKey('detected_at')) {
      context.handle(
          _detectedAtMeta,
          detectedAt.isAcceptableOrUnknown(
              data['detected_at']!, _detectedAtMeta));
    } else if (isInserting) {
      context.missing(_detectedAtMeta);
    }
    if (data.containsKey('video_offset_ms')) {
      context.handle(
          _videoOffsetMsMeta,
          videoOffsetMs.isAcceptableOrUnknown(
              data['video_offset_ms']!, _videoOffsetMsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetectionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetectionRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      evidenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_id']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      confidence: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      bboxLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bbox_left'])!,
      bboxTop: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bbox_top'])!,
      bboxRight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bbox_right'])!,
      bboxBottom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bbox_bottom'])!,
      bboxNormalized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bbox_normalized'])!,
      detectedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detected_at'])!,
      videoOffsetMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_offset_ms']),
    );
  }

  @override
  $DetectionsTable createAlias(String alias) {
    return $DetectionsTable(attachedDatabase, alias);
  }
}

class DetectionRecord extends DataClass implements Insertable<DetectionRecord> {
  final String id;
  final String caseId;
  final String sessionId;
  final String? evidenceId;
  final String category;
  final double confidence;
  final double bboxLeft;
  final double bboxTop;
  final double bboxRight;
  final double bboxBottom;
  final bool bboxNormalized;
  final int detectedAt;
  final int? videoOffsetMs;
  const DetectionRecord(
      {required this.id,
      required this.caseId,
      required this.sessionId,
      this.evidenceId,
      required this.category,
      required this.confidence,
      required this.bboxLeft,
      required this.bboxTop,
      required this.bboxRight,
      required this.bboxBottom,
      required this.bboxNormalized,
      required this.detectedAt,
      this.videoOffsetMs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || evidenceId != null) {
      map['evidence_id'] = Variable<String>(evidenceId);
    }
    map['category'] = Variable<String>(category);
    map['confidence'] = Variable<double>(confidence);
    map['bbox_left'] = Variable<double>(bboxLeft);
    map['bbox_top'] = Variable<double>(bboxTop);
    map['bbox_right'] = Variable<double>(bboxRight);
    map['bbox_bottom'] = Variable<double>(bboxBottom);
    map['bbox_normalized'] = Variable<bool>(bboxNormalized);
    map['detected_at'] = Variable<int>(detectedAt);
    if (!nullToAbsent || videoOffsetMs != null) {
      map['video_offset_ms'] = Variable<int>(videoOffsetMs);
    }
    return map;
  }

  DetectionsCompanion toCompanion(bool nullToAbsent) {
    return DetectionsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      sessionId: Value(sessionId),
      evidenceId: evidenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(evidenceId),
      category: Value(category),
      confidence: Value(confidence),
      bboxLeft: Value(bboxLeft),
      bboxTop: Value(bboxTop),
      bboxRight: Value(bboxRight),
      bboxBottom: Value(bboxBottom),
      bboxNormalized: Value(bboxNormalized),
      detectedAt: Value(detectedAt),
      videoOffsetMs: videoOffsetMs == null && nullToAbsent
          ? const Value.absent()
          : Value(videoOffsetMs),
    );
  }

  factory DetectionRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetectionRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      evidenceId: serializer.fromJson<String?>(json['evidenceId']),
      category: serializer.fromJson<String>(json['category']),
      confidence: serializer.fromJson<double>(json['confidence']),
      bboxLeft: serializer.fromJson<double>(json['bboxLeft']),
      bboxTop: serializer.fromJson<double>(json['bboxTop']),
      bboxRight: serializer.fromJson<double>(json['bboxRight']),
      bboxBottom: serializer.fromJson<double>(json['bboxBottom']),
      bboxNormalized: serializer.fromJson<bool>(json['bboxNormalized']),
      detectedAt: serializer.fromJson<int>(json['detectedAt']),
      videoOffsetMs: serializer.fromJson<int?>(json['videoOffsetMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'sessionId': serializer.toJson<String>(sessionId),
      'evidenceId': serializer.toJson<String?>(evidenceId),
      'category': serializer.toJson<String>(category),
      'confidence': serializer.toJson<double>(confidence),
      'bboxLeft': serializer.toJson<double>(bboxLeft),
      'bboxTop': serializer.toJson<double>(bboxTop),
      'bboxRight': serializer.toJson<double>(bboxRight),
      'bboxBottom': serializer.toJson<double>(bboxBottom),
      'bboxNormalized': serializer.toJson<bool>(bboxNormalized),
      'detectedAt': serializer.toJson<int>(detectedAt),
      'videoOffsetMs': serializer.toJson<int?>(videoOffsetMs),
    };
  }

  DetectionRecord copyWith(
          {String? id,
          String? caseId,
          String? sessionId,
          Value<String?> evidenceId = const Value.absent(),
          String? category,
          double? confidence,
          double? bboxLeft,
          double? bboxTop,
          double? bboxRight,
          double? bboxBottom,
          bool? bboxNormalized,
          int? detectedAt,
          Value<int?> videoOffsetMs = const Value.absent()}) =>
      DetectionRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        sessionId: sessionId ?? this.sessionId,
        evidenceId: evidenceId.present ? evidenceId.value : this.evidenceId,
        category: category ?? this.category,
        confidence: confidence ?? this.confidence,
        bboxLeft: bboxLeft ?? this.bboxLeft,
        bboxTop: bboxTop ?? this.bboxTop,
        bboxRight: bboxRight ?? this.bboxRight,
        bboxBottom: bboxBottom ?? this.bboxBottom,
        bboxNormalized: bboxNormalized ?? this.bboxNormalized,
        detectedAt: detectedAt ?? this.detectedAt,
        videoOffsetMs:
            videoOffsetMs.present ? videoOffsetMs.value : this.videoOffsetMs,
      );
  DetectionRecord copyWithCompanion(DetectionsCompanion data) {
    return DetectionRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      evidenceId:
          data.evidenceId.present ? data.evidenceId.value : this.evidenceId,
      category: data.category.present ? data.category.value : this.category,
      confidence:
          data.confidence.present ? data.confidence.value : this.confidence,
      bboxLeft: data.bboxLeft.present ? data.bboxLeft.value : this.bboxLeft,
      bboxTop: data.bboxTop.present ? data.bboxTop.value : this.bboxTop,
      bboxRight: data.bboxRight.present ? data.bboxRight.value : this.bboxRight,
      bboxBottom:
          data.bboxBottom.present ? data.bboxBottom.value : this.bboxBottom,
      bboxNormalized: data.bboxNormalized.present
          ? data.bboxNormalized.value
          : this.bboxNormalized,
      detectedAt:
          data.detectedAt.present ? data.detectedAt.value : this.detectedAt,
      videoOffsetMs: data.videoOffsetMs.present
          ? data.videoOffsetMs.value
          : this.videoOffsetMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetectionRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('evidenceId: $evidenceId, ')
          ..write('category: $category, ')
          ..write('confidence: $confidence, ')
          ..write('bboxLeft: $bboxLeft, ')
          ..write('bboxTop: $bboxTop, ')
          ..write('bboxRight: $bboxRight, ')
          ..write('bboxBottom: $bboxBottom, ')
          ..write('bboxNormalized: $bboxNormalized, ')
          ..write('detectedAt: $detectedAt, ')
          ..write('videoOffsetMs: $videoOffsetMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      caseId,
      sessionId,
      evidenceId,
      category,
      confidence,
      bboxLeft,
      bboxTop,
      bboxRight,
      bboxBottom,
      bboxNormalized,
      detectedAt,
      videoOffsetMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetectionRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.sessionId == this.sessionId &&
          other.evidenceId == this.evidenceId &&
          other.category == this.category &&
          other.confidence == this.confidence &&
          other.bboxLeft == this.bboxLeft &&
          other.bboxTop == this.bboxTop &&
          other.bboxRight == this.bboxRight &&
          other.bboxBottom == this.bboxBottom &&
          other.bboxNormalized == this.bboxNormalized &&
          other.detectedAt == this.detectedAt &&
          other.videoOffsetMs == this.videoOffsetMs);
}

class DetectionsCompanion extends UpdateCompanion<DetectionRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> sessionId;
  final Value<String?> evidenceId;
  final Value<String> category;
  final Value<double> confidence;
  final Value<double> bboxLeft;
  final Value<double> bboxTop;
  final Value<double> bboxRight;
  final Value<double> bboxBottom;
  final Value<bool> bboxNormalized;
  final Value<int> detectedAt;
  final Value<int?> videoOffsetMs;
  final Value<int> rowid;
  const DetectionsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.evidenceId = const Value.absent(),
    this.category = const Value.absent(),
    this.confidence = const Value.absent(),
    this.bboxLeft = const Value.absent(),
    this.bboxTop = const Value.absent(),
    this.bboxRight = const Value.absent(),
    this.bboxBottom = const Value.absent(),
    this.bboxNormalized = const Value.absent(),
    this.detectedAt = const Value.absent(),
    this.videoOffsetMs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DetectionsCompanion.insert({
    required String id,
    required String caseId,
    required String sessionId,
    this.evidenceId = const Value.absent(),
    required String category,
    required double confidence,
    required double bboxLeft,
    required double bboxTop,
    required double bboxRight,
    required double bboxBottom,
    required bool bboxNormalized,
    required int detectedAt,
    this.videoOffsetMs = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        sessionId = Value(sessionId),
        category = Value(category),
        confidence = Value(confidence),
        bboxLeft = Value(bboxLeft),
        bboxTop = Value(bboxTop),
        bboxRight = Value(bboxRight),
        bboxBottom = Value(bboxBottom),
        bboxNormalized = Value(bboxNormalized),
        detectedAt = Value(detectedAt);
  static Insertable<DetectionRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? sessionId,
    Expression<String>? evidenceId,
    Expression<String>? category,
    Expression<double>? confidence,
    Expression<double>? bboxLeft,
    Expression<double>? bboxTop,
    Expression<double>? bboxRight,
    Expression<double>? bboxBottom,
    Expression<bool>? bboxNormalized,
    Expression<int>? detectedAt,
    Expression<int>? videoOffsetMs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (sessionId != null) 'session_id': sessionId,
      if (evidenceId != null) 'evidence_id': evidenceId,
      if (category != null) 'category': category,
      if (confidence != null) 'confidence': confidence,
      if (bboxLeft != null) 'bbox_left': bboxLeft,
      if (bboxTop != null) 'bbox_top': bboxTop,
      if (bboxRight != null) 'bbox_right': bboxRight,
      if (bboxBottom != null) 'bbox_bottom': bboxBottom,
      if (bboxNormalized != null) 'bbox_normalized': bboxNormalized,
      if (detectedAt != null) 'detected_at': detectedAt,
      if (videoOffsetMs != null) 'video_offset_ms': videoOffsetMs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DetectionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<String>? sessionId,
      Value<String?>? evidenceId,
      Value<String>? category,
      Value<double>? confidence,
      Value<double>? bboxLeft,
      Value<double>? bboxTop,
      Value<double>? bboxRight,
      Value<double>? bboxBottom,
      Value<bool>? bboxNormalized,
      Value<int>? detectedAt,
      Value<int?>? videoOffsetMs,
      Value<int>? rowid}) {
    return DetectionsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      sessionId: sessionId ?? this.sessionId,
      evidenceId: evidenceId ?? this.evidenceId,
      category: category ?? this.category,
      confidence: confidence ?? this.confidence,
      bboxLeft: bboxLeft ?? this.bboxLeft,
      bboxTop: bboxTop ?? this.bboxTop,
      bboxRight: bboxRight ?? this.bboxRight,
      bboxBottom: bboxBottom ?? this.bboxBottom,
      bboxNormalized: bboxNormalized ?? this.bboxNormalized,
      detectedAt: detectedAt ?? this.detectedAt,
      videoOffsetMs: videoOffsetMs ?? this.videoOffsetMs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (evidenceId.present) {
      map['evidence_id'] = Variable<String>(evidenceId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (bboxLeft.present) {
      map['bbox_left'] = Variable<double>(bboxLeft.value);
    }
    if (bboxTop.present) {
      map['bbox_top'] = Variable<double>(bboxTop.value);
    }
    if (bboxRight.present) {
      map['bbox_right'] = Variable<double>(bboxRight.value);
    }
    if (bboxBottom.present) {
      map['bbox_bottom'] = Variable<double>(bboxBottom.value);
    }
    if (bboxNormalized.present) {
      map['bbox_normalized'] = Variable<bool>(bboxNormalized.value);
    }
    if (detectedAt.present) {
      map['detected_at'] = Variable<int>(detectedAt.value);
    }
    if (videoOffsetMs.present) {
      map['video_offset_ms'] = Variable<int>(videoOffsetMs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetectionsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('evidenceId: $evidenceId, ')
          ..write('category: $category, ')
          ..write('confidence: $confidence, ')
          ..write('bboxLeft: $bboxLeft, ')
          ..write('bboxTop: $bboxTop, ')
          ..write('bboxRight: $bboxRight, ')
          ..write('bboxBottom: $bboxBottom, ')
          ..write('bboxNormalized: $bboxNormalized, ')
          ..write('detectedAt: $detectedAt, ')
          ..write('videoOffsetMs: $videoOffsetMs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditEventsTable extends AuditEvents
    with TableInfo<$AuditEventsTable, AuditEventRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sequenceMeta =
      const VerificationMeta('sequence');
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
      'sequence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _occurredAtMeta =
      const VerificationMeta('occurredAt');
  @override
  late final GeneratedColumn<int> occurredAt = GeneratedColumn<int>(
      'occurred_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _detailsJsonMeta =
      const VerificationMeta('detailsJson');
  @override
  late final GeneratedColumn<String> detailsJson = GeneratedColumn<String>(
      'details_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previousHashMeta =
      const VerificationMeta('previousHash');
  @override
  late final GeneratedColumn<String> previousHash = GeneratedColumn<String>(
      'previous_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actorIdMeta =
      const VerificationMeta('actorId');
  @override
  late final GeneratedColumn<String> actorId = GeneratedColumn<String>(
      'actor_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        caseId,
        sequence,
        action,
        occurredAt,
        detailsJson,
        previousHash,
        hash,
        actorId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_events';
  @override
  VerificationContext validateIntegrity(Insertable<AuditEventRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta,
          occurredAt.isAcceptableOrUnknown(
              data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('details_json')) {
      context.handle(
          _detailsJsonMeta,
          detailsJson.isAcceptableOrUnknown(
              data['details_json']!, _detailsJsonMeta));
    } else if (isInserting) {
      context.missing(_detailsJsonMeta);
    }
    if (data.containsKey('previous_hash')) {
      context.handle(
          _previousHashMeta,
          previousHash.isAcceptableOrUnknown(
              data['previous_hash']!, _previousHashMeta));
    } else if (isInserting) {
      context.missing(_previousHashMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('actor_id')) {
      context.handle(_actorIdMeta,
          actorId.isAcceptableOrUnknown(data['actor_id']!, _actorIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditEventRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditEventRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      sequence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sequence'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      occurredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}occurred_at'])!,
      detailsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details_json'])!,
      previousHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}previous_hash'])!,
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
      actorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}actor_id']),
    );
  }

  @override
  $AuditEventsTable createAlias(String alias) {
    return $AuditEventsTable(attachedDatabase, alias);
  }
}

class AuditEventRecord extends DataClass
    implements Insertable<AuditEventRecord> {
  final String id;
  final String caseId;
  final int sequence;
  final String action;
  final int occurredAt;
  final String detailsJson;
  final String previousHash;
  final String hash;
  final String? actorId;
  const AuditEventRecord(
      {required this.id,
      required this.caseId,
      required this.sequence,
      required this.action,
      required this.occurredAt,
      required this.detailsJson,
      required this.previousHash,
      required this.hash,
      this.actorId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['sequence'] = Variable<int>(sequence);
    map['action'] = Variable<String>(action);
    map['occurred_at'] = Variable<int>(occurredAt);
    map['details_json'] = Variable<String>(detailsJson);
    map['previous_hash'] = Variable<String>(previousHash);
    map['hash'] = Variable<String>(hash);
    if (!nullToAbsent || actorId != null) {
      map['actor_id'] = Variable<String>(actorId);
    }
    return map;
  }

  AuditEventsCompanion toCompanion(bool nullToAbsent) {
    return AuditEventsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      sequence: Value(sequence),
      action: Value(action),
      occurredAt: Value(occurredAt),
      detailsJson: Value(detailsJson),
      previousHash: Value(previousHash),
      hash: Value(hash),
      actorId: actorId == null && nullToAbsent
          ? const Value.absent()
          : Value(actorId),
    );
  }

  factory AuditEventRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditEventRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      sequence: serializer.fromJson<int>(json['sequence']),
      action: serializer.fromJson<String>(json['action']),
      occurredAt: serializer.fromJson<int>(json['occurredAt']),
      detailsJson: serializer.fromJson<String>(json['detailsJson']),
      previousHash: serializer.fromJson<String>(json['previousHash']),
      hash: serializer.fromJson<String>(json['hash']),
      actorId: serializer.fromJson<String?>(json['actorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'sequence': serializer.toJson<int>(sequence),
      'action': serializer.toJson<String>(action),
      'occurredAt': serializer.toJson<int>(occurredAt),
      'detailsJson': serializer.toJson<String>(detailsJson),
      'previousHash': serializer.toJson<String>(previousHash),
      'hash': serializer.toJson<String>(hash),
      'actorId': serializer.toJson<String?>(actorId),
    };
  }

  AuditEventRecord copyWith(
          {String? id,
          String? caseId,
          int? sequence,
          String? action,
          int? occurredAt,
          String? detailsJson,
          String? previousHash,
          String? hash,
          Value<String?> actorId = const Value.absent()}) =>
      AuditEventRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        sequence: sequence ?? this.sequence,
        action: action ?? this.action,
        occurredAt: occurredAt ?? this.occurredAt,
        detailsJson: detailsJson ?? this.detailsJson,
        previousHash: previousHash ?? this.previousHash,
        hash: hash ?? this.hash,
        actorId: actorId.present ? actorId.value : this.actorId,
      );
  AuditEventRecord copyWithCompanion(AuditEventsCompanion data) {
    return AuditEventRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      action: data.action.present ? data.action.value : this.action,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      detailsJson:
          data.detailsJson.present ? data.detailsJson.value : this.detailsJson,
      previousHash: data.previousHash.present
          ? data.previousHash.value
          : this.previousHash,
      hash: data.hash.present ? data.hash.value : this.hash,
      actorId: data.actorId.present ? data.actorId.value : this.actorId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditEventRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sequence: $sequence, ')
          ..write('action: $action, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('detailsJson: $detailsJson, ')
          ..write('previousHash: $previousHash, ')
          ..write('hash: $hash, ')
          ..write('actorId: $actorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, caseId, sequence, action, occurredAt,
      detailsJson, previousHash, hash, actorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditEventRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.sequence == this.sequence &&
          other.action == this.action &&
          other.occurredAt == this.occurredAt &&
          other.detailsJson == this.detailsJson &&
          other.previousHash == this.previousHash &&
          other.hash == this.hash &&
          other.actorId == this.actorId);
}

class AuditEventsCompanion extends UpdateCompanion<AuditEventRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<int> sequence;
  final Value<String> action;
  final Value<int> occurredAt;
  final Value<String> detailsJson;
  final Value<String> previousHash;
  final Value<String> hash;
  final Value<String?> actorId;
  final Value<int> rowid;
  const AuditEventsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.sequence = const Value.absent(),
    this.action = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.detailsJson = const Value.absent(),
    this.previousHash = const Value.absent(),
    this.hash = const Value.absent(),
    this.actorId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditEventsCompanion.insert({
    required String id,
    required String caseId,
    required int sequence,
    required String action,
    required int occurredAt,
    required String detailsJson,
    required String previousHash,
    required String hash,
    this.actorId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        sequence = Value(sequence),
        action = Value(action),
        occurredAt = Value(occurredAt),
        detailsJson = Value(detailsJson),
        previousHash = Value(previousHash),
        hash = Value(hash);
  static Insertable<AuditEventRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<int>? sequence,
    Expression<String>? action,
    Expression<int>? occurredAt,
    Expression<String>? detailsJson,
    Expression<String>? previousHash,
    Expression<String>? hash,
    Expression<String>? actorId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (sequence != null) 'sequence': sequence,
      if (action != null) 'action': action,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (detailsJson != null) 'details_json': detailsJson,
      if (previousHash != null) 'previous_hash': previousHash,
      if (hash != null) 'hash': hash,
      if (actorId != null) 'actor_id': actorId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<int>? sequence,
      Value<String>? action,
      Value<int>? occurredAt,
      Value<String>? detailsJson,
      Value<String>? previousHash,
      Value<String>? hash,
      Value<String?>? actorId,
      Value<int>? rowid}) {
    return AuditEventsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      sequence: sequence ?? this.sequence,
      action: action ?? this.action,
      occurredAt: occurredAt ?? this.occurredAt,
      detailsJson: detailsJson ?? this.detailsJson,
      previousHash: previousHash ?? this.previousHash,
      hash: hash ?? this.hash,
      actorId: actorId ?? this.actorId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<int>(occurredAt.value);
    }
    if (detailsJson.present) {
      map['details_json'] = Variable<String>(detailsJson.value);
    }
    if (previousHash.present) {
      map['previous_hash'] = Variable<String>(previousHash.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (actorId.present) {
      map['actor_id'] = Variable<String>(actorId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditEventsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sequence: $sequence, ')
          ..write('action: $action, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('detailsJson: $detailsJson, ')
          ..write('previousHash: $previousHash, ')
          ..write('hash: $hash, ')
          ..write('actorId: $actorId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimelineEntriesTable extends TimelineEntries
    with TableInfo<$TimelineEntriesTable, TimelineEntryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _occurredAtMeta =
      const VerificationMeta('occurredAt');
  @override
  late final GeneratedColumn<int> occurredAt = GeneratedColumn<int>(
      'occurred_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _videoOffsetMsMeta =
      const VerificationMeta('videoOffsetMs');
  @override
  late final GeneratedColumn<int> videoOffsetMs = GeneratedColumn<int>(
      'video_offset_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _evidenceIdMeta =
      const VerificationMeta('evidenceId');
  @override
  late final GeneratedColumn<String> evidenceId = GeneratedColumn<String>(
      'evidence_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _segmentIdMeta =
      const VerificationMeta('segmentId');
  @override
  late final GeneratedColumn<String> segmentId = GeneratedColumn<String>(
      'segment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detectionIdMeta =
      const VerificationMeta('detectionId');
  @override
  late final GeneratedColumn<String> detectionId = GeneratedColumn<String>(
      'detection_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        caseId,
        sessionId,
        type,
        occurredAt,
        videoOffsetMs,
        evidenceId,
        segmentId,
        detectionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<TimelineEntryRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta,
          occurredAt.isAcceptableOrUnknown(
              data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('video_offset_ms')) {
      context.handle(
          _videoOffsetMsMeta,
          videoOffsetMs.isAcceptableOrUnknown(
              data['video_offset_ms']!, _videoOffsetMsMeta));
    } else if (isInserting) {
      context.missing(_videoOffsetMsMeta);
    }
    if (data.containsKey('evidence_id')) {
      context.handle(
          _evidenceIdMeta,
          evidenceId.isAcceptableOrUnknown(
              data['evidence_id']!, _evidenceIdMeta));
    }
    if (data.containsKey('segment_id')) {
      context.handle(_segmentIdMeta,
          segmentId.isAcceptableOrUnknown(data['segment_id']!, _segmentIdMeta));
    }
    if (data.containsKey('detection_id')) {
      context.handle(
          _detectionIdMeta,
          detectionId.isAcceptableOrUnknown(
              data['detection_id']!, _detectionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineEntryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineEntryRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      occurredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}occurred_at'])!,
      videoOffsetMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_offset_ms'])!,
      evidenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_id']),
      segmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}segment_id']),
      detectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detection_id']),
    );
  }

  @override
  $TimelineEntriesTable createAlias(String alias) {
    return $TimelineEntriesTable(attachedDatabase, alias);
  }
}

class TimelineEntryRecord extends DataClass
    implements Insertable<TimelineEntryRecord> {
  final String id;
  final String caseId;
  final String sessionId;
  final String type;
  final int occurredAt;
  final int videoOffsetMs;
  final String? evidenceId;
  final String? segmentId;
  final String? detectionId;
  const TimelineEntryRecord(
      {required this.id,
      required this.caseId,
      required this.sessionId,
      required this.type,
      required this.occurredAt,
      required this.videoOffsetMs,
      this.evidenceId,
      this.segmentId,
      this.detectionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['session_id'] = Variable<String>(sessionId);
    map['type'] = Variable<String>(type);
    map['occurred_at'] = Variable<int>(occurredAt);
    map['video_offset_ms'] = Variable<int>(videoOffsetMs);
    if (!nullToAbsent || evidenceId != null) {
      map['evidence_id'] = Variable<String>(evidenceId);
    }
    if (!nullToAbsent || segmentId != null) {
      map['segment_id'] = Variable<String>(segmentId);
    }
    if (!nullToAbsent || detectionId != null) {
      map['detection_id'] = Variable<String>(detectionId);
    }
    return map;
  }

  TimelineEntriesCompanion toCompanion(bool nullToAbsent) {
    return TimelineEntriesCompanion(
      id: Value(id),
      caseId: Value(caseId),
      sessionId: Value(sessionId),
      type: Value(type),
      occurredAt: Value(occurredAt),
      videoOffsetMs: Value(videoOffsetMs),
      evidenceId: evidenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(evidenceId),
      segmentId: segmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(segmentId),
      detectionId: detectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(detectionId),
    );
  }

  factory TimelineEntryRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineEntryRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      type: serializer.fromJson<String>(json['type']),
      occurredAt: serializer.fromJson<int>(json['occurredAt']),
      videoOffsetMs: serializer.fromJson<int>(json['videoOffsetMs']),
      evidenceId: serializer.fromJson<String?>(json['evidenceId']),
      segmentId: serializer.fromJson<String?>(json['segmentId']),
      detectionId: serializer.fromJson<String?>(json['detectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'sessionId': serializer.toJson<String>(sessionId),
      'type': serializer.toJson<String>(type),
      'occurredAt': serializer.toJson<int>(occurredAt),
      'videoOffsetMs': serializer.toJson<int>(videoOffsetMs),
      'evidenceId': serializer.toJson<String?>(evidenceId),
      'segmentId': serializer.toJson<String?>(segmentId),
      'detectionId': serializer.toJson<String?>(detectionId),
    };
  }

  TimelineEntryRecord copyWith(
          {String? id,
          String? caseId,
          String? sessionId,
          String? type,
          int? occurredAt,
          int? videoOffsetMs,
          Value<String?> evidenceId = const Value.absent(),
          Value<String?> segmentId = const Value.absent(),
          Value<String?> detectionId = const Value.absent()}) =>
      TimelineEntryRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        sessionId: sessionId ?? this.sessionId,
        type: type ?? this.type,
        occurredAt: occurredAt ?? this.occurredAt,
        videoOffsetMs: videoOffsetMs ?? this.videoOffsetMs,
        evidenceId: evidenceId.present ? evidenceId.value : this.evidenceId,
        segmentId: segmentId.present ? segmentId.value : this.segmentId,
        detectionId: detectionId.present ? detectionId.value : this.detectionId,
      );
  TimelineEntryRecord copyWithCompanion(TimelineEntriesCompanion data) {
    return TimelineEntryRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      type: data.type.present ? data.type.value : this.type,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      videoOffsetMs: data.videoOffsetMs.present
          ? data.videoOffsetMs.value
          : this.videoOffsetMs,
      evidenceId:
          data.evidenceId.present ? data.evidenceId.value : this.evidenceId,
      segmentId: data.segmentId.present ? data.segmentId.value : this.segmentId,
      detectionId:
          data.detectionId.present ? data.detectionId.value : this.detectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEntryRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('videoOffsetMs: $videoOffsetMs, ')
          ..write('evidenceId: $evidenceId, ')
          ..write('segmentId: $segmentId, ')
          ..write('detectionId: $detectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, caseId, sessionId, type, occurredAt,
      videoOffsetMs, evidenceId, segmentId, detectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineEntryRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.sessionId == this.sessionId &&
          other.type == this.type &&
          other.occurredAt == this.occurredAt &&
          other.videoOffsetMs == this.videoOffsetMs &&
          other.evidenceId == this.evidenceId &&
          other.segmentId == this.segmentId &&
          other.detectionId == this.detectionId);
}

class TimelineEntriesCompanion extends UpdateCompanion<TimelineEntryRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> sessionId;
  final Value<String> type;
  final Value<int> occurredAt;
  final Value<int> videoOffsetMs;
  final Value<String?> evidenceId;
  final Value<String?> segmentId;
  final Value<String?> detectionId;
  final Value<int> rowid;
  const TimelineEntriesCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.type = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.videoOffsetMs = const Value.absent(),
    this.evidenceId = const Value.absent(),
    this.segmentId = const Value.absent(),
    this.detectionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimelineEntriesCompanion.insert({
    required String id,
    required String caseId,
    required String sessionId,
    required String type,
    required int occurredAt,
    required int videoOffsetMs,
    this.evidenceId = const Value.absent(),
    this.segmentId = const Value.absent(),
    this.detectionId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        sessionId = Value(sessionId),
        type = Value(type),
        occurredAt = Value(occurredAt),
        videoOffsetMs = Value(videoOffsetMs);
  static Insertable<TimelineEntryRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? sessionId,
    Expression<String>? type,
    Expression<int>? occurredAt,
    Expression<int>? videoOffsetMs,
    Expression<String>? evidenceId,
    Expression<String>? segmentId,
    Expression<String>? detectionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (sessionId != null) 'session_id': sessionId,
      if (type != null) 'type': type,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (videoOffsetMs != null) 'video_offset_ms': videoOffsetMs,
      if (evidenceId != null) 'evidence_id': evidenceId,
      if (segmentId != null) 'segment_id': segmentId,
      if (detectionId != null) 'detection_id': detectionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimelineEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<String>? sessionId,
      Value<String>? type,
      Value<int>? occurredAt,
      Value<int>? videoOffsetMs,
      Value<String?>? evidenceId,
      Value<String?>? segmentId,
      Value<String?>? detectionId,
      Value<int>? rowid}) {
    return TimelineEntriesCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      sessionId: sessionId ?? this.sessionId,
      type: type ?? this.type,
      occurredAt: occurredAt ?? this.occurredAt,
      videoOffsetMs: videoOffsetMs ?? this.videoOffsetMs,
      evidenceId: evidenceId ?? this.evidenceId,
      segmentId: segmentId ?? this.segmentId,
      detectionId: detectionId ?? this.detectionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<int>(occurredAt.value);
    }
    if (videoOffsetMs.present) {
      map['video_offset_ms'] = Variable<int>(videoOffsetMs.value);
    }
    if (evidenceId.present) {
      map['evidence_id'] = Variable<String>(evidenceId.value);
    }
    if (segmentId.present) {
      map['segment_id'] = Variable<String>(segmentId.value);
    }
    if (detectionId.present) {
      map['detection_id'] = Variable<String>(detectionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEntriesCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('sessionId: $sessionId, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('videoOffsetMs: $videoOffsetMs, ')
          ..write('evidenceId: $evidenceId, ')
          ..write('segmentId: $segmentId, ')
          ..write('detectionId: $detectionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfficerPathPointsTable extends OfficerPathPoints
    with TableInfo<$OfficerPathPointsTable, OfficerPathPointRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficerPathPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _altitudeMeta =
      const VerificationMeta('altitude');
  @override
  late final GeneratedColumn<double> altitude = GeneratedColumn<double>(
      'altitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _accuracyMeta =
      const VerificationMeta('accuracy');
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
      'accuracy', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _headingMeta =
      const VerificationMeta('heading');
  @override
  late final GeneratedColumn<double> heading = GeneratedColumn<double>(
      'heading', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
      'speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        latitude,
        longitude,
        altitude,
        accuracy,
        heading,
        speed,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'officer_path_points';
  @override
  VerificationContext validateIntegrity(
      Insertable<OfficerPathPointRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('altitude')) {
      context.handle(_altitudeMeta,
          altitude.isAcceptableOrUnknown(data['altitude']!, _altitudeMeta));
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    }
    if (data.containsKey('heading')) {
      context.handle(_headingMeta,
          heading.isAcceptableOrUnknown(data['heading']!, _headingMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfficerPathPointRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfficerPathPointRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      altitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}altitude']),
      accuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}accuracy']),
      heading: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}heading']),
      speed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}speed']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $OfficerPathPointsTable createAlias(String alias) {
    return $OfficerPathPointsTable(attachedDatabase, alias);
  }
}

class OfficerPathPointRecord extends DataClass
    implements Insertable<OfficerPathPointRecord> {
  final int id;
  final String sessionId;
  final double latitude;
  final double longitude;
  final double? altitude;
  final double? accuracy;
  final double? heading;
  final double? speed;
  final int timestamp;
  const OfficerPathPointRecord(
      {required this.id,
      required this.sessionId,
      required this.latitude,
      required this.longitude,
      this.altitude,
      this.accuracy,
      this.heading,
      this.speed,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || altitude != null) {
      map['altitude'] = Variable<double>(altitude);
    }
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double>(accuracy);
    }
    if (!nullToAbsent || heading != null) {
      map['heading'] = Variable<double>(heading);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    map['timestamp'] = Variable<int>(timestamp);
    return map;
  }

  OfficerPathPointsCompanion toCompanion(bool nullToAbsent) {
    return OfficerPathPointsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      altitude: altitude == null && nullToAbsent
          ? const Value.absent()
          : Value(altitude),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      heading: heading == null && nullToAbsent
          ? const Value.absent()
          : Value(heading),
      speed:
          speed == null && nullToAbsent ? const Value.absent() : Value(speed),
      timestamp: Value(timestamp),
    );
  }

  factory OfficerPathPointRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfficerPathPointRecord(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      altitude: serializer.fromJson<double?>(json['altitude']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      heading: serializer.fromJson<double?>(json['heading']),
      speed: serializer.fromJson<double?>(json['speed']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'altitude': serializer.toJson<double?>(altitude),
      'accuracy': serializer.toJson<double?>(accuracy),
      'heading': serializer.toJson<double?>(heading),
      'speed': serializer.toJson<double?>(speed),
      'timestamp': serializer.toJson<int>(timestamp),
    };
  }

  OfficerPathPointRecord copyWith(
          {int? id,
          String? sessionId,
          double? latitude,
          double? longitude,
          Value<double?> altitude = const Value.absent(),
          Value<double?> accuracy = const Value.absent(),
          Value<double?> heading = const Value.absent(),
          Value<double?> speed = const Value.absent(),
          int? timestamp}) =>
      OfficerPathPointRecord(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        altitude: altitude.present ? altitude.value : this.altitude,
        accuracy: accuracy.present ? accuracy.value : this.accuracy,
        heading: heading.present ? heading.value : this.heading,
        speed: speed.present ? speed.value : this.speed,
        timestamp: timestamp ?? this.timestamp,
      );
  OfficerPathPointRecord copyWithCompanion(OfficerPathPointsCompanion data) {
    return OfficerPathPointRecord(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      altitude: data.altitude.present ? data.altitude.value : this.altitude,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      heading: data.heading.present ? data.heading.value : this.heading,
      speed: data.speed.present ? data.speed.value : this.speed,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfficerPathPointRecord(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitude: $altitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('heading: $heading, ')
          ..write('speed: $speed, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, latitude, longitude, altitude,
      accuracy, heading, speed, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfficerPathPointRecord &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.altitude == this.altitude &&
          other.accuracy == this.accuracy &&
          other.heading == this.heading &&
          other.speed == this.speed &&
          other.timestamp == this.timestamp);
}

class OfficerPathPointsCompanion
    extends UpdateCompanion<OfficerPathPointRecord> {
  final Value<int> id;
  final Value<String> sessionId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> altitude;
  final Value<double?> accuracy;
  final Value<double?> heading;
  final Value<double?> speed;
  final Value<int> timestamp;
  const OfficerPathPointsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.altitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.heading = const Value.absent(),
    this.speed = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  OfficerPathPointsCompanion.insert({
    this.id = const Value.absent(),
    required String sessionId,
    required double latitude,
    required double longitude,
    this.altitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.heading = const Value.absent(),
    this.speed = const Value.absent(),
    required int timestamp,
  })  : sessionId = Value(sessionId),
        latitude = Value(latitude),
        longitude = Value(longitude),
        timestamp = Value(timestamp);
  static Insertable<OfficerPathPointRecord> custom({
    Expression<int>? id,
    Expression<String>? sessionId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? altitude,
    Expression<double>? accuracy,
    Expression<double>? heading,
    Expression<double>? speed,
    Expression<int>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (altitude != null) 'altitude': altitude,
      if (accuracy != null) 'accuracy': accuracy,
      if (heading != null) 'heading': heading,
      if (speed != null) 'speed': speed,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  OfficerPathPointsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sessionId,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<double?>? altitude,
      Value<double?>? accuracy,
      Value<double?>? heading,
      Value<double?>? speed,
      Value<int>? timestamp}) {
    return OfficerPathPointsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitude: altitude ?? this.altitude,
      accuracy: accuracy ?? this.accuracy,
      heading: heading ?? this.heading,
      speed: speed ?? this.speed,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (altitude.present) {
      map['altitude'] = Variable<double>(altitude.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (heading.present) {
      map['heading'] = Variable<double>(heading.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficerPathPointsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitude: $altitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('heading: $heading, ')
          ..write('speed: $speed, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $ReportsTable extends Reports
    with TableInfo<$ReportsTable, ReportRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
      'case_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<int> generatedAt = GeneratedColumn<int>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
      'sha256', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _passwordProtectedMeta =
      const VerificationMeta('passwordProtected');
  @override
  late final GeneratedColumn<bool> passwordProtected = GeneratedColumn<bool>(
      'password_protected', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("password_protected" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, caseId, generatedAt, filePath, sha256, sizeBytes, passwordProtected];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reports';
  @override
  VerificationContext validateIntegrity(Insertable<ReportRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(_sha256Meta,
          sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta));
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('password_protected')) {
      context.handle(
          _passwordProtectedMeta,
          passwordProtected.isAcceptableOrUnknown(
              data['password_protected']!, _passwordProtectedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_id'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}generated_at'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      sha256: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha256'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      passwordProtected: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}password_protected']),
    );
  }

  @override
  $ReportsTable createAlias(String alias) {
    return $ReportsTable(attachedDatabase, alias);
  }
}

class ReportRecord extends DataClass implements Insertable<ReportRecord> {
  final String id;
  final String caseId;
  final int generatedAt;
  final String filePath;
  final String sha256;
  final int sizeBytes;
  final bool? passwordProtected;
  const ReportRecord(
      {required this.id,
      required this.caseId,
      required this.generatedAt,
      required this.filePath,
      required this.sha256,
      required this.sizeBytes,
      this.passwordProtected});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['generated_at'] = Variable<int>(generatedAt);
    map['file_path'] = Variable<String>(filePath);
    map['sha256'] = Variable<String>(sha256);
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || passwordProtected != null) {
      map['password_protected'] = Variable<bool>(passwordProtected);
    }
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      caseId: Value(caseId),
      generatedAt: Value(generatedAt),
      filePath: Value(filePath),
      sha256: Value(sha256),
      sizeBytes: Value(sizeBytes),
      passwordProtected: passwordProtected == null && nullToAbsent
          ? const Value.absent()
          : Value(passwordProtected),
    );
  }

  factory ReportRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportRecord(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      generatedAt: serializer.fromJson<int>(json['generatedAt']),
      filePath: serializer.fromJson<String>(json['filePath']),
      sha256: serializer.fromJson<String>(json['sha256']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      passwordProtected: serializer.fromJson<bool?>(json['passwordProtected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'generatedAt': serializer.toJson<int>(generatedAt),
      'filePath': serializer.toJson<String>(filePath),
      'sha256': serializer.toJson<String>(sha256),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'passwordProtected': serializer.toJson<bool?>(passwordProtected),
    };
  }

  ReportRecord copyWith(
          {String? id,
          String? caseId,
          int? generatedAt,
          String? filePath,
          String? sha256,
          int? sizeBytes,
          Value<bool?> passwordProtected = const Value.absent()}) =>
      ReportRecord(
        id: id ?? this.id,
        caseId: caseId ?? this.caseId,
        generatedAt: generatedAt ?? this.generatedAt,
        filePath: filePath ?? this.filePath,
        sha256: sha256 ?? this.sha256,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        passwordProtected: passwordProtected.present
            ? passwordProtected.value
            : this.passwordProtected,
      );
  ReportRecord copyWithCompanion(ReportsCompanion data) {
    return ReportRecord(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      passwordProtected: data.passwordProtected.present
          ? data.passwordProtected.value
          : this.passwordProtected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportRecord(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('passwordProtected: $passwordProtected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, caseId, generatedAt, filePath, sha256, sizeBytes, passwordProtected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportRecord &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.generatedAt == this.generatedAt &&
          other.filePath == this.filePath &&
          other.sha256 == this.sha256 &&
          other.sizeBytes == this.sizeBytes &&
          other.passwordProtected == this.passwordProtected);
}

class ReportsCompanion extends UpdateCompanion<ReportRecord> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<int> generatedAt;
  final Value<String> filePath;
  final Value<String> sha256;
  final Value<int> sizeBytes;
  final Value<bool?> passwordProtected;
  final Value<int> rowid;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.filePath = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.passwordProtected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReportsCompanion.insert({
    required String id,
    required String caseId,
    required int generatedAt,
    required String filePath,
    required String sha256,
    required int sizeBytes,
    this.passwordProtected = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        caseId = Value(caseId),
        generatedAt = Value(generatedAt),
        filePath = Value(filePath),
        sha256 = Value(sha256),
        sizeBytes = Value(sizeBytes);
  static Insertable<ReportRecord> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<int>? generatedAt,
    Expression<String>? filePath,
    Expression<String>? sha256,
    Expression<int>? sizeBytes,
    Expression<bool>? passwordProtected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (filePath != null) 'file_path': filePath,
      if (sha256 != null) 'sha256': sha256,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (passwordProtected != null) 'password_protected': passwordProtected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReportsCompanion copyWith(
      {Value<String>? id,
      Value<String>? caseId,
      Value<int>? generatedAt,
      Value<String>? filePath,
      Value<String>? sha256,
      Value<int>? sizeBytes,
      Value<bool?>? passwordProtected,
      Value<int>? rowid}) {
    return ReportsCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      generatedAt: generatedAt ?? this.generatedAt,
      filePath: filePath ?? this.filePath,
      sha256: sha256 ?? this.sha256,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      passwordProtected: passwordProtected ?? this.passwordProtected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<int>(generatedAt.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (passwordProtected.present) {
      map['password_protected'] = Variable<bool>(passwordProtected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('filePath: $filePath, ')
          ..write('sha256: $sha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('passwordProtected: $passwordProtected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ScsiDatabase extends GeneratedDatabase {
  _$ScsiDatabase(QueryExecutor e) : super(e);
  $ScsiDatabaseManager get managers => $ScsiDatabaseManager(this);
  late final $CasesTable cases = $CasesTable(this);
  late final $RecordingSessionsTable recordingSessions =
      $RecordingSessionsTable(this);
  late final $VideoSegmentsTable videoSegments = $VideoSegmentsTable(this);
  late final $EvidenceItemsTable evidenceItems = $EvidenceItemsTable(this);
  late final $DetectionsTable detections = $DetectionsTable(this);
  late final $AuditEventsTable auditEvents = $AuditEventsTable(this);
  late final $TimelineEntriesTable timelineEntries =
      $TimelineEntriesTable(this);
  late final $OfficerPathPointsTable officerPathPoints =
      $OfficerPathPointsTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        cases,
        recordingSessions,
        videoSegments,
        evidenceItems,
        detections,
        auditEvents,
        timelineEntries,
        officerPathPoints,
        reports
      ];
}

typedef $$CasesTableCreateCompanionBuilder = CasesCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  Value<String?> jurisdiction,
  required int createdAt,
  required String officerId,
  required String officerName,
  required String officerBadge,
  required String officerAgency,
  required String officerRank,
  required String deviceId,
  required String deviceManufacturer,
  required String deviceModel,
  required String deviceOsVersion,
  required String deviceAppVersion,
  required double initialLat,
  required double initialLng,
  Value<double?> initialAlt,
  Value<double?> initialAccuracy,
  Value<double?> initialHeading,
  Value<double?> initialSpeed,
  Value<int> rowid,
});
typedef $$CasesTableUpdateCompanionBuilder = CasesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String?> jurisdiction,
  Value<int> createdAt,
  Value<String> officerId,
  Value<String> officerName,
  Value<String> officerBadge,
  Value<String> officerAgency,
  Value<String> officerRank,
  Value<String> deviceId,
  Value<String> deviceManufacturer,
  Value<String> deviceModel,
  Value<String> deviceOsVersion,
  Value<String> deviceAppVersion,
  Value<double> initialLat,
  Value<double> initialLng,
  Value<double?> initialAlt,
  Value<double?> initialAccuracy,
  Value<double?> initialHeading,
  Value<double?> initialSpeed,
  Value<int> rowid,
});

class $$CasesTableFilterComposer extends Composer<_$ScsiDatabase, $CasesTable> {
  $$CasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jurisdiction => $composableBuilder(
      column: $table.jurisdiction, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get officerId => $composableBuilder(
      column: $table.officerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get officerName => $composableBuilder(
      column: $table.officerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get officerBadge => $composableBuilder(
      column: $table.officerBadge, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get officerAgency => $composableBuilder(
      column: $table.officerAgency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get officerRank => $composableBuilder(
      column: $table.officerRank, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceManufacturer => $composableBuilder(
      column: $table.deviceManufacturer,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceModel => $composableBuilder(
      column: $table.deviceModel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceOsVersion => $composableBuilder(
      column: $table.deviceOsVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceAppVersion => $composableBuilder(
      column: $table.deviceAppVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialLat => $composableBuilder(
      column: $table.initialLat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialLng => $composableBuilder(
      column: $table.initialLng, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialAlt => $composableBuilder(
      column: $table.initialAlt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialAccuracy => $composableBuilder(
      column: $table.initialAccuracy,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialHeading => $composableBuilder(
      column: $table.initialHeading,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialSpeed => $composableBuilder(
      column: $table.initialSpeed, builder: (column) => ColumnFilters(column));
}

class $$CasesTableOrderingComposer
    extends Composer<_$ScsiDatabase, $CasesTable> {
  $$CasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jurisdiction => $composableBuilder(
      column: $table.jurisdiction,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get officerId => $composableBuilder(
      column: $table.officerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get officerName => $composableBuilder(
      column: $table.officerName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get officerBadge => $composableBuilder(
      column: $table.officerBadge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get officerAgency => $composableBuilder(
      column: $table.officerAgency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get officerRank => $composableBuilder(
      column: $table.officerRank, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceManufacturer => $composableBuilder(
      column: $table.deviceManufacturer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceModel => $composableBuilder(
      column: $table.deviceModel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceOsVersion => $composableBuilder(
      column: $table.deviceOsVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceAppVersion => $composableBuilder(
      column: $table.deviceAppVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialLat => $composableBuilder(
      column: $table.initialLat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialLng => $composableBuilder(
      column: $table.initialLng, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialAlt => $composableBuilder(
      column: $table.initialAlt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialAccuracy => $composableBuilder(
      column: $table.initialAccuracy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialHeading => $composableBuilder(
      column: $table.initialHeading,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialSpeed => $composableBuilder(
      column: $table.initialSpeed,
      builder: (column) => ColumnOrderings(column));
}

class $$CasesTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $CasesTable> {
  $$CasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get jurisdiction => $composableBuilder(
      column: $table.jurisdiction, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get officerId =>
      $composableBuilder(column: $table.officerId, builder: (column) => column);

  GeneratedColumn<String> get officerName => $composableBuilder(
      column: $table.officerName, builder: (column) => column);

  GeneratedColumn<String> get officerBadge => $composableBuilder(
      column: $table.officerBadge, builder: (column) => column);

  GeneratedColumn<String> get officerAgency => $composableBuilder(
      column: $table.officerAgency, builder: (column) => column);

  GeneratedColumn<String> get officerRank => $composableBuilder(
      column: $table.officerRank, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get deviceManufacturer => $composableBuilder(
      column: $table.deviceManufacturer, builder: (column) => column);

  GeneratedColumn<String> get deviceModel => $composableBuilder(
      column: $table.deviceModel, builder: (column) => column);

  GeneratedColumn<String> get deviceOsVersion => $composableBuilder(
      column: $table.deviceOsVersion, builder: (column) => column);

  GeneratedColumn<String> get deviceAppVersion => $composableBuilder(
      column: $table.deviceAppVersion, builder: (column) => column);

  GeneratedColumn<double> get initialLat => $composableBuilder(
      column: $table.initialLat, builder: (column) => column);

  GeneratedColumn<double> get initialLng => $composableBuilder(
      column: $table.initialLng, builder: (column) => column);

  GeneratedColumn<double> get initialAlt => $composableBuilder(
      column: $table.initialAlt, builder: (column) => column);

  GeneratedColumn<double> get initialAccuracy => $composableBuilder(
      column: $table.initialAccuracy, builder: (column) => column);

  GeneratedColumn<double> get initialHeading => $composableBuilder(
      column: $table.initialHeading, builder: (column) => column);

  GeneratedColumn<double> get initialSpeed => $composableBuilder(
      column: $table.initialSpeed, builder: (column) => column);
}

class $$CasesTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $CasesTable,
    CaseRecord,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (CaseRecord, BaseReferences<_$ScsiDatabase, $CasesTable, CaseRecord>),
    CaseRecord,
    PrefetchHooks Function()> {
  $$CasesTableTableManager(_$ScsiDatabase db, $CasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> jurisdiction = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<String> officerId = const Value.absent(),
            Value<String> officerName = const Value.absent(),
            Value<String> officerBadge = const Value.absent(),
            Value<String> officerAgency = const Value.absent(),
            Value<String> officerRank = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<String> deviceManufacturer = const Value.absent(),
            Value<String> deviceModel = const Value.absent(),
            Value<String> deviceOsVersion = const Value.absent(),
            Value<String> deviceAppVersion = const Value.absent(),
            Value<double> initialLat = const Value.absent(),
            Value<double> initialLng = const Value.absent(),
            Value<double?> initialAlt = const Value.absent(),
            Value<double?> initialAccuracy = const Value.absent(),
            Value<double?> initialHeading = const Value.absent(),
            Value<double?> initialSpeed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CasesCompanion(
            id: id,
            title: title,
            description: description,
            jurisdiction: jurisdiction,
            createdAt: createdAt,
            officerId: officerId,
            officerName: officerName,
            officerBadge: officerBadge,
            officerAgency: officerAgency,
            officerRank: officerRank,
            deviceId: deviceId,
            deviceManufacturer: deviceManufacturer,
            deviceModel: deviceModel,
            deviceOsVersion: deviceOsVersion,
            deviceAppVersion: deviceAppVersion,
            initialLat: initialLat,
            initialLng: initialLng,
            initialAlt: initialAlt,
            initialAccuracy: initialAccuracy,
            initialHeading: initialHeading,
            initialSpeed: initialSpeed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<String?> jurisdiction = const Value.absent(),
            required int createdAt,
            required String officerId,
            required String officerName,
            required String officerBadge,
            required String officerAgency,
            required String officerRank,
            required String deviceId,
            required String deviceManufacturer,
            required String deviceModel,
            required String deviceOsVersion,
            required String deviceAppVersion,
            required double initialLat,
            required double initialLng,
            Value<double?> initialAlt = const Value.absent(),
            Value<double?> initialAccuracy = const Value.absent(),
            Value<double?> initialHeading = const Value.absent(),
            Value<double?> initialSpeed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CasesCompanion.insert(
            id: id,
            title: title,
            description: description,
            jurisdiction: jurisdiction,
            createdAt: createdAt,
            officerId: officerId,
            officerName: officerName,
            officerBadge: officerBadge,
            officerAgency: officerAgency,
            officerRank: officerRank,
            deviceId: deviceId,
            deviceManufacturer: deviceManufacturer,
            deviceModel: deviceModel,
            deviceOsVersion: deviceOsVersion,
            deviceAppVersion: deviceAppVersion,
            initialLat: initialLat,
            initialLng: initialLng,
            initialAlt: initialAlt,
            initialAccuracy: initialAccuracy,
            initialHeading: initialHeading,
            initialSpeed: initialSpeed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CasesTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $CasesTable,
    CaseRecord,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (CaseRecord, BaseReferences<_$ScsiDatabase, $CasesTable, CaseRecord>),
    CaseRecord,
    PrefetchHooks Function()>;
typedef $$RecordingSessionsTableCreateCompanionBuilder
    = RecordingSessionsCompanion Function({
  required String id,
  required String caseId,
  required int startedAt,
  required String startedBy,
  Value<int?> endedAt,
  Value<String?> endedBy,
  Value<int> rowid,
});
typedef $$RecordingSessionsTableUpdateCompanionBuilder
    = RecordingSessionsCompanion Function({
  Value<String> id,
  Value<String> caseId,
  Value<int> startedAt,
  Value<String> startedBy,
  Value<int?> endedAt,
  Value<String?> endedBy,
  Value<int> rowid,
});

class $$RecordingSessionsTableFilterComposer
    extends Composer<_$ScsiDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startedBy => $composableBuilder(
      column: $table.startedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endedBy => $composableBuilder(
      column: $table.endedBy, builder: (column) => ColumnFilters(column));
}

class $$RecordingSessionsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startedBy => $composableBuilder(
      column: $table.startedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endedBy => $composableBuilder(
      column: $table.endedBy, builder: (column) => ColumnOrderings(column));
}

class $$RecordingSessionsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $RecordingSessionsTable> {
  $$RecordingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<String> get startedBy =>
      $composableBuilder(column: $table.startedBy, builder: (column) => column);

  GeneratedColumn<int> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get endedBy =>
      $composableBuilder(column: $table.endedBy, builder: (column) => column);
}

class $$RecordingSessionsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $RecordingSessionsTable,
    RecordingSessionRecord,
    $$RecordingSessionsTableFilterComposer,
    $$RecordingSessionsTableOrderingComposer,
    $$RecordingSessionsTableAnnotationComposer,
    $$RecordingSessionsTableCreateCompanionBuilder,
    $$RecordingSessionsTableUpdateCompanionBuilder,
    (
      RecordingSessionRecord,
      BaseReferences<_$ScsiDatabase, $RecordingSessionsTable,
          RecordingSessionRecord>
    ),
    RecordingSessionRecord,
    PrefetchHooks Function()> {
  $$RecordingSessionsTableTableManager(
      _$ScsiDatabase db, $RecordingSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordingSessionsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<int> startedAt = const Value.absent(),
            Value<String> startedBy = const Value.absent(),
            Value<int?> endedAt = const Value.absent(),
            Value<String?> endedBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordingSessionsCompanion(
            id: id,
            caseId: caseId,
            startedAt: startedAt,
            startedBy: startedBy,
            endedAt: endedAt,
            endedBy: endedBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required int startedAt,
            required String startedBy,
            Value<int?> endedAt = const Value.absent(),
            Value<String?> endedBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordingSessionsCompanion.insert(
            id: id,
            caseId: caseId,
            startedAt: startedAt,
            startedBy: startedBy,
            endedAt: endedAt,
            endedBy: endedBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecordingSessionsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $RecordingSessionsTable,
    RecordingSessionRecord,
    $$RecordingSessionsTableFilterComposer,
    $$RecordingSessionsTableOrderingComposer,
    $$RecordingSessionsTableAnnotationComposer,
    $$RecordingSessionsTableCreateCompanionBuilder,
    $$RecordingSessionsTableUpdateCompanionBuilder,
    (
      RecordingSessionRecord,
      BaseReferences<_$ScsiDatabase, $RecordingSessionsTable,
          RecordingSessionRecord>
    ),
    RecordingSessionRecord,
    PrefetchHooks Function()>;
typedef $$VideoSegmentsTableCreateCompanionBuilder = VideoSegmentsCompanion
    Function({
  required String id,
  required String sessionId,
  required String filePath,
  required String sha256,
  required int sizeBytes,
  required int startTime,
  required int endTime,
  required int startOffsetMs,
  required int endOffsetMs,
  Value<bool> finalized,
  Value<bool> abrupt,
  Value<int> rowid,
});
typedef $$VideoSegmentsTableUpdateCompanionBuilder = VideoSegmentsCompanion
    Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> filePath,
  Value<String> sha256,
  Value<int> sizeBytes,
  Value<int> startTime,
  Value<int> endTime,
  Value<int> startOffsetMs,
  Value<int> endOffsetMs,
  Value<bool> finalized,
  Value<bool> abrupt,
  Value<int> rowid,
});

class $$VideoSegmentsTableFilterComposer
    extends Composer<_$ScsiDatabase, $VideoSegmentsTable> {
  $$VideoSegmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startOffsetMs => $composableBuilder(
      column: $table.startOffsetMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endOffsetMs => $composableBuilder(
      column: $table.endOffsetMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get finalized => $composableBuilder(
      column: $table.finalized, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get abrupt => $composableBuilder(
      column: $table.abrupt, builder: (column) => ColumnFilters(column));
}

class $$VideoSegmentsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $VideoSegmentsTable> {
  $$VideoSegmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startOffsetMs => $composableBuilder(
      column: $table.startOffsetMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endOffsetMs => $composableBuilder(
      column: $table.endOffsetMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get finalized => $composableBuilder(
      column: $table.finalized, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get abrupt => $composableBuilder(
      column: $table.abrupt, builder: (column) => ColumnOrderings(column));
}

class $$VideoSegmentsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $VideoSegmentsTable> {
  $$VideoSegmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get startOffsetMs => $composableBuilder(
      column: $table.startOffsetMs, builder: (column) => column);

  GeneratedColumn<int> get endOffsetMs => $composableBuilder(
      column: $table.endOffsetMs, builder: (column) => column);

  GeneratedColumn<bool> get finalized =>
      $composableBuilder(column: $table.finalized, builder: (column) => column);

  GeneratedColumn<bool> get abrupt =>
      $composableBuilder(column: $table.abrupt, builder: (column) => column);
}

class $$VideoSegmentsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $VideoSegmentsTable,
    VideoSegmentRecord,
    $$VideoSegmentsTableFilterComposer,
    $$VideoSegmentsTableOrderingComposer,
    $$VideoSegmentsTableAnnotationComposer,
    $$VideoSegmentsTableCreateCompanionBuilder,
    $$VideoSegmentsTableUpdateCompanionBuilder,
    (
      VideoSegmentRecord,
      BaseReferences<_$ScsiDatabase, $VideoSegmentsTable, VideoSegmentRecord>
    ),
    VideoSegmentRecord,
    PrefetchHooks Function()> {
  $$VideoSegmentsTableTableManager(_$ScsiDatabase db, $VideoSegmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideoSegmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideoSegmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideoSegmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> sha256 = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
            Value<int> startOffsetMs = const Value.absent(),
            Value<int> endOffsetMs = const Value.absent(),
            Value<bool> finalized = const Value.absent(),
            Value<bool> abrupt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VideoSegmentsCompanion(
            id: id,
            sessionId: sessionId,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            startTime: startTime,
            endTime: endTime,
            startOffsetMs: startOffsetMs,
            endOffsetMs: endOffsetMs,
            finalized: finalized,
            abrupt: abrupt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sessionId,
            required String filePath,
            required String sha256,
            required int sizeBytes,
            required int startTime,
            required int endTime,
            required int startOffsetMs,
            required int endOffsetMs,
            Value<bool> finalized = const Value.absent(),
            Value<bool> abrupt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VideoSegmentsCompanion.insert(
            id: id,
            sessionId: sessionId,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            startTime: startTime,
            endTime: endTime,
            startOffsetMs: startOffsetMs,
            endOffsetMs: endOffsetMs,
            finalized: finalized,
            abrupt: abrupt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VideoSegmentsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $VideoSegmentsTable,
    VideoSegmentRecord,
    $$VideoSegmentsTableFilterComposer,
    $$VideoSegmentsTableOrderingComposer,
    $$VideoSegmentsTableAnnotationComposer,
    $$VideoSegmentsTableCreateCompanionBuilder,
    $$VideoSegmentsTableUpdateCompanionBuilder,
    (
      VideoSegmentRecord,
      BaseReferences<_$ScsiDatabase, $VideoSegmentsTable, VideoSegmentRecord>
    ),
    VideoSegmentRecord,
    PrefetchHooks Function()>;
typedef $$EvidenceItemsTableCreateCompanionBuilder = EvidenceItemsCompanion
    Function({
  required String id,
  required String caseId,
  required String sessionId,
  required String capturedBy,
  required int capturedAt,
  required int videoOffsetMs,
  required double latitude,
  required double longitude,
  Value<double?> altitude,
  Value<double?> accuracy,
  Value<double?> heading,
  Value<double?> speed,
  required String type,
  Value<String?> filePath,
  Value<String?> sha256,
  Value<int?> sizeBytes,
  Value<String?> mimeType,
  Value<int?> width,
  Value<int?> height,
  Value<int?> durationMs,
  Value<String?> noteText,
  Value<int> rowid,
});
typedef $$EvidenceItemsTableUpdateCompanionBuilder = EvidenceItemsCompanion
    Function({
  Value<String> id,
  Value<String> caseId,
  Value<String> sessionId,
  Value<String> capturedBy,
  Value<int> capturedAt,
  Value<int> videoOffsetMs,
  Value<double> latitude,
  Value<double> longitude,
  Value<double?> altitude,
  Value<double?> accuracy,
  Value<double?> heading,
  Value<double?> speed,
  Value<String> type,
  Value<String?> filePath,
  Value<String?> sha256,
  Value<int?> sizeBytes,
  Value<String?> mimeType,
  Value<int?> width,
  Value<int?> height,
  Value<int?> durationMs,
  Value<String?> noteText,
  Value<int> rowid,
});

class $$EvidenceItemsTableFilterComposer
    extends Composer<_$ScsiDatabase, $EvidenceItemsTable> {
  $$EvidenceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get altitude => $composableBuilder(
      column: $table.altitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get noteText => $composableBuilder(
      column: $table.noteText, builder: (column) => ColumnFilters(column));
}

class $$EvidenceItemsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $EvidenceItemsTable> {
  $$EvidenceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get altitude => $composableBuilder(
      column: $table.altitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get noteText => $composableBuilder(
      column: $table.noteText, builder: (column) => ColumnOrderings(column));
}

class $$EvidenceItemsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $EvidenceItemsTable> {
  $$EvidenceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => column);

  GeneratedColumn<int> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => column);

  GeneratedColumn<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get altitude =>
      $composableBuilder(column: $table.altitude, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<double> get heading =>
      $composableBuilder(column: $table.heading, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => column);

  GeneratedColumn<String> get noteText =>
      $composableBuilder(column: $table.noteText, builder: (column) => column);
}

class $$EvidenceItemsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $EvidenceItemsTable,
    EvidenceItemRecord,
    $$EvidenceItemsTableFilterComposer,
    $$EvidenceItemsTableOrderingComposer,
    $$EvidenceItemsTableAnnotationComposer,
    $$EvidenceItemsTableCreateCompanionBuilder,
    $$EvidenceItemsTableUpdateCompanionBuilder,
    (
      EvidenceItemRecord,
      BaseReferences<_$ScsiDatabase, $EvidenceItemsTable, EvidenceItemRecord>
    ),
    EvidenceItemRecord,
    PrefetchHooks Function()> {
  $$EvidenceItemsTableTableManager(_$ScsiDatabase db, $EvidenceItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvidenceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvidenceItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvidenceItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String> capturedBy = const Value.absent(),
            Value<int> capturedAt = const Value.absent(),
            Value<int> videoOffsetMs = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<double?> altitude = const Value.absent(),
            Value<double?> accuracy = const Value.absent(),
            Value<double?> heading = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> filePath = const Value.absent(),
            Value<String?> sha256 = const Value.absent(),
            Value<int?> sizeBytes = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            Value<int?> durationMs = const Value.absent(),
            Value<String?> noteText = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvidenceItemsCompanion(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            capturedBy: capturedBy,
            capturedAt: capturedAt,
            videoOffsetMs: videoOffsetMs,
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            accuracy: accuracy,
            heading: heading,
            speed: speed,
            type: type,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            mimeType: mimeType,
            width: width,
            height: height,
            durationMs: durationMs,
            noteText: noteText,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required String sessionId,
            required String capturedBy,
            required int capturedAt,
            required int videoOffsetMs,
            required double latitude,
            required double longitude,
            Value<double?> altitude = const Value.absent(),
            Value<double?> accuracy = const Value.absent(),
            Value<double?> heading = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            required String type,
            Value<String?> filePath = const Value.absent(),
            Value<String?> sha256 = const Value.absent(),
            Value<int?> sizeBytes = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            Value<int?> durationMs = const Value.absent(),
            Value<String?> noteText = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvidenceItemsCompanion.insert(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            capturedBy: capturedBy,
            capturedAt: capturedAt,
            videoOffsetMs: videoOffsetMs,
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            accuracy: accuracy,
            heading: heading,
            speed: speed,
            type: type,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            mimeType: mimeType,
            width: width,
            height: height,
            durationMs: durationMs,
            noteText: noteText,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EvidenceItemsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $EvidenceItemsTable,
    EvidenceItemRecord,
    $$EvidenceItemsTableFilterComposer,
    $$EvidenceItemsTableOrderingComposer,
    $$EvidenceItemsTableAnnotationComposer,
    $$EvidenceItemsTableCreateCompanionBuilder,
    $$EvidenceItemsTableUpdateCompanionBuilder,
    (
      EvidenceItemRecord,
      BaseReferences<_$ScsiDatabase, $EvidenceItemsTable, EvidenceItemRecord>
    ),
    EvidenceItemRecord,
    PrefetchHooks Function()>;
typedef $$DetectionsTableCreateCompanionBuilder = DetectionsCompanion Function({
  required String id,
  required String caseId,
  required String sessionId,
  Value<String?> evidenceId,
  required String category,
  required double confidence,
  required double bboxLeft,
  required double bboxTop,
  required double bboxRight,
  required double bboxBottom,
  required bool bboxNormalized,
  required int detectedAt,
  Value<int?> videoOffsetMs,
  Value<int> rowid,
});
typedef $$DetectionsTableUpdateCompanionBuilder = DetectionsCompanion Function({
  Value<String> id,
  Value<String> caseId,
  Value<String> sessionId,
  Value<String?> evidenceId,
  Value<String> category,
  Value<double> confidence,
  Value<double> bboxLeft,
  Value<double> bboxTop,
  Value<double> bboxRight,
  Value<double> bboxBottom,
  Value<bool> bboxNormalized,
  Value<int> detectedAt,
  Value<int?> videoOffsetMs,
  Value<int> rowid,
});

class $$DetectionsTableFilterComposer
    extends Composer<_$ScsiDatabase, $DetectionsTable> {
  $$DetectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bboxLeft => $composableBuilder(
      column: $table.bboxLeft, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bboxTop => $composableBuilder(
      column: $table.bboxTop, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bboxRight => $composableBuilder(
      column: $table.bboxRight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bboxBottom => $composableBuilder(
      column: $table.bboxBottom, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bboxNormalized => $composableBuilder(
      column: $table.bboxNormalized,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => ColumnFilters(column));
}

class $$DetectionsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $DetectionsTable> {
  $$DetectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bboxLeft => $composableBuilder(
      column: $table.bboxLeft, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bboxTop => $composableBuilder(
      column: $table.bboxTop, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bboxRight => $composableBuilder(
      column: $table.bboxRight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bboxBottom => $composableBuilder(
      column: $table.bboxBottom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bboxNormalized => $composableBuilder(
      column: $table.bboxNormalized,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs,
      builder: (column) => ColumnOrderings(column));
}

class $$DetectionsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $DetectionsTable> {
  $$DetectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => column);

  GeneratedColumn<double> get bboxLeft =>
      $composableBuilder(column: $table.bboxLeft, builder: (column) => column);

  GeneratedColumn<double> get bboxTop =>
      $composableBuilder(column: $table.bboxTop, builder: (column) => column);

  GeneratedColumn<double> get bboxRight =>
      $composableBuilder(column: $table.bboxRight, builder: (column) => column);

  GeneratedColumn<double> get bboxBottom => $composableBuilder(
      column: $table.bboxBottom, builder: (column) => column);

  GeneratedColumn<bool> get bboxNormalized => $composableBuilder(
      column: $table.bboxNormalized, builder: (column) => column);

  GeneratedColumn<int> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => column);

  GeneratedColumn<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => column);
}

class $$DetectionsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $DetectionsTable,
    DetectionRecord,
    $$DetectionsTableFilterComposer,
    $$DetectionsTableOrderingComposer,
    $$DetectionsTableAnnotationComposer,
    $$DetectionsTableCreateCompanionBuilder,
    $$DetectionsTableUpdateCompanionBuilder,
    (
      DetectionRecord,
      BaseReferences<_$ScsiDatabase, $DetectionsTable, DetectionRecord>
    ),
    DetectionRecord,
    PrefetchHooks Function()> {
  $$DetectionsTableTableManager(_$ScsiDatabase db, $DetectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String?> evidenceId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double> confidence = const Value.absent(),
            Value<double> bboxLeft = const Value.absent(),
            Value<double> bboxTop = const Value.absent(),
            Value<double> bboxRight = const Value.absent(),
            Value<double> bboxBottom = const Value.absent(),
            Value<bool> bboxNormalized = const Value.absent(),
            Value<int> detectedAt = const Value.absent(),
            Value<int?> videoOffsetMs = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DetectionsCompanion(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            evidenceId: evidenceId,
            category: category,
            confidence: confidence,
            bboxLeft: bboxLeft,
            bboxTop: bboxTop,
            bboxRight: bboxRight,
            bboxBottom: bboxBottom,
            bboxNormalized: bboxNormalized,
            detectedAt: detectedAt,
            videoOffsetMs: videoOffsetMs,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required String sessionId,
            Value<String?> evidenceId = const Value.absent(),
            required String category,
            required double confidence,
            required double bboxLeft,
            required double bboxTop,
            required double bboxRight,
            required double bboxBottom,
            required bool bboxNormalized,
            required int detectedAt,
            Value<int?> videoOffsetMs = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DetectionsCompanion.insert(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            evidenceId: evidenceId,
            category: category,
            confidence: confidence,
            bboxLeft: bboxLeft,
            bboxTop: bboxTop,
            bboxRight: bboxRight,
            bboxBottom: bboxBottom,
            bboxNormalized: bboxNormalized,
            detectedAt: detectedAt,
            videoOffsetMs: videoOffsetMs,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DetectionsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $DetectionsTable,
    DetectionRecord,
    $$DetectionsTableFilterComposer,
    $$DetectionsTableOrderingComposer,
    $$DetectionsTableAnnotationComposer,
    $$DetectionsTableCreateCompanionBuilder,
    $$DetectionsTableUpdateCompanionBuilder,
    (
      DetectionRecord,
      BaseReferences<_$ScsiDatabase, $DetectionsTable, DetectionRecord>
    ),
    DetectionRecord,
    PrefetchHooks Function()>;
typedef $$AuditEventsTableCreateCompanionBuilder = AuditEventsCompanion
    Function({
  required String id,
  required String caseId,
  required int sequence,
  required String action,
  required int occurredAt,
  required String detailsJson,
  required String previousHash,
  required String hash,
  Value<String?> actorId,
  Value<int> rowid,
});
typedef $$AuditEventsTableUpdateCompanionBuilder = AuditEventsCompanion
    Function({
  Value<String> id,
  Value<String> caseId,
  Value<int> sequence,
  Value<String> action,
  Value<int> occurredAt,
  Value<String> detailsJson,
  Value<String> previousHash,
  Value<String> hash,
  Value<String?> actorId,
  Value<int> rowid,
});

class $$AuditEventsTableFilterComposer
    extends Composer<_$ScsiDatabase, $AuditEventsTable> {
  $$AuditEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get previousHash => $composableBuilder(
      column: $table.previousHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actorId => $composableBuilder(
      column: $table.actorId, builder: (column) => ColumnFilters(column));
}

class $$AuditEventsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $AuditEventsTable> {
  $$AuditEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get previousHash => $composableBuilder(
      column: $table.previousHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actorId => $composableBuilder(
      column: $table.actorId, builder: (column) => ColumnOrderings(column));
}

class $$AuditEventsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $AuditEventsTable> {
  $$AuditEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => column);

  GeneratedColumn<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => column);

  GeneratedColumn<String> get previousHash => $composableBuilder(
      column: $table.previousHash, builder: (column) => column);

  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<String> get actorId =>
      $composableBuilder(column: $table.actorId, builder: (column) => column);
}

class $$AuditEventsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $AuditEventsTable,
    AuditEventRecord,
    $$AuditEventsTableFilterComposer,
    $$AuditEventsTableOrderingComposer,
    $$AuditEventsTableAnnotationComposer,
    $$AuditEventsTableCreateCompanionBuilder,
    $$AuditEventsTableUpdateCompanionBuilder,
    (
      AuditEventRecord,
      BaseReferences<_$ScsiDatabase, $AuditEventsTable, AuditEventRecord>
    ),
    AuditEventRecord,
    PrefetchHooks Function()> {
  $$AuditEventsTableTableManager(_$ScsiDatabase db, $AuditEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<int> sequence = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<int> occurredAt = const Value.absent(),
            Value<String> detailsJson = const Value.absent(),
            Value<String> previousHash = const Value.absent(),
            Value<String> hash = const Value.absent(),
            Value<String?> actorId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditEventsCompanion(
            id: id,
            caseId: caseId,
            sequence: sequence,
            action: action,
            occurredAt: occurredAt,
            detailsJson: detailsJson,
            previousHash: previousHash,
            hash: hash,
            actorId: actorId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required int sequence,
            required String action,
            required int occurredAt,
            required String detailsJson,
            required String previousHash,
            required String hash,
            Value<String?> actorId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditEventsCompanion.insert(
            id: id,
            caseId: caseId,
            sequence: sequence,
            action: action,
            occurredAt: occurredAt,
            detailsJson: detailsJson,
            previousHash: previousHash,
            hash: hash,
            actorId: actorId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditEventsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $AuditEventsTable,
    AuditEventRecord,
    $$AuditEventsTableFilterComposer,
    $$AuditEventsTableOrderingComposer,
    $$AuditEventsTableAnnotationComposer,
    $$AuditEventsTableCreateCompanionBuilder,
    $$AuditEventsTableUpdateCompanionBuilder,
    (
      AuditEventRecord,
      BaseReferences<_$ScsiDatabase, $AuditEventsTable, AuditEventRecord>
    ),
    AuditEventRecord,
    PrefetchHooks Function()>;
typedef $$TimelineEntriesTableCreateCompanionBuilder = TimelineEntriesCompanion
    Function({
  required String id,
  required String caseId,
  required String sessionId,
  required String type,
  required int occurredAt,
  required int videoOffsetMs,
  Value<String?> evidenceId,
  Value<String?> segmentId,
  Value<String?> detectionId,
  Value<int> rowid,
});
typedef $$TimelineEntriesTableUpdateCompanionBuilder = TimelineEntriesCompanion
    Function({
  Value<String> id,
  Value<String> caseId,
  Value<String> sessionId,
  Value<String> type,
  Value<int> occurredAt,
  Value<int> videoOffsetMs,
  Value<String?> evidenceId,
  Value<String?> segmentId,
  Value<String?> detectionId,
  Value<int> rowid,
});

class $$TimelineEntriesTableFilterComposer
    extends Composer<_$ScsiDatabase, $TimelineEntriesTable> {
  $$TimelineEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get segmentId => $composableBuilder(
      column: $table.segmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detectionId => $composableBuilder(
      column: $table.detectionId, builder: (column) => ColumnFilters(column));
}

class $$TimelineEntriesTableOrderingComposer
    extends Composer<_$ScsiDatabase, $TimelineEntriesTable> {
  $$TimelineEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get segmentId => $composableBuilder(
      column: $table.segmentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detectionId => $composableBuilder(
      column: $table.detectionId, builder: (column) => ColumnOrderings(column));
}

class $$TimelineEntriesTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $TimelineEntriesTable> {
  $$TimelineEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => column);

  GeneratedColumn<int> get videoOffsetMs => $composableBuilder(
      column: $table.videoOffsetMs, builder: (column) => column);

  GeneratedColumn<String> get evidenceId => $composableBuilder(
      column: $table.evidenceId, builder: (column) => column);

  GeneratedColumn<String> get segmentId =>
      $composableBuilder(column: $table.segmentId, builder: (column) => column);

  GeneratedColumn<String> get detectionId => $composableBuilder(
      column: $table.detectionId, builder: (column) => column);
}

class $$TimelineEntriesTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $TimelineEntriesTable,
    TimelineEntryRecord,
    $$TimelineEntriesTableFilterComposer,
    $$TimelineEntriesTableOrderingComposer,
    $$TimelineEntriesTableAnnotationComposer,
    $$TimelineEntriesTableCreateCompanionBuilder,
    $$TimelineEntriesTableUpdateCompanionBuilder,
    (
      TimelineEntryRecord,
      BaseReferences<_$ScsiDatabase, $TimelineEntriesTable, TimelineEntryRecord>
    ),
    TimelineEntryRecord,
    PrefetchHooks Function()> {
  $$TimelineEntriesTableTableManager(
      _$ScsiDatabase db, $TimelineEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> occurredAt = const Value.absent(),
            Value<int> videoOffsetMs = const Value.absent(),
            Value<String?> evidenceId = const Value.absent(),
            Value<String?> segmentId = const Value.absent(),
            Value<String?> detectionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TimelineEntriesCompanion(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            type: type,
            occurredAt: occurredAt,
            videoOffsetMs: videoOffsetMs,
            evidenceId: evidenceId,
            segmentId: segmentId,
            detectionId: detectionId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required String sessionId,
            required String type,
            required int occurredAt,
            required int videoOffsetMs,
            Value<String?> evidenceId = const Value.absent(),
            Value<String?> segmentId = const Value.absent(),
            Value<String?> detectionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TimelineEntriesCompanion.insert(
            id: id,
            caseId: caseId,
            sessionId: sessionId,
            type: type,
            occurredAt: occurredAt,
            videoOffsetMs: videoOffsetMs,
            evidenceId: evidenceId,
            segmentId: segmentId,
            detectionId: detectionId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TimelineEntriesTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $TimelineEntriesTable,
    TimelineEntryRecord,
    $$TimelineEntriesTableFilterComposer,
    $$TimelineEntriesTableOrderingComposer,
    $$TimelineEntriesTableAnnotationComposer,
    $$TimelineEntriesTableCreateCompanionBuilder,
    $$TimelineEntriesTableUpdateCompanionBuilder,
    (
      TimelineEntryRecord,
      BaseReferences<_$ScsiDatabase, $TimelineEntriesTable, TimelineEntryRecord>
    ),
    TimelineEntryRecord,
    PrefetchHooks Function()>;
typedef $$OfficerPathPointsTableCreateCompanionBuilder
    = OfficerPathPointsCompanion Function({
  Value<int> id,
  required String sessionId,
  required double latitude,
  required double longitude,
  Value<double?> altitude,
  Value<double?> accuracy,
  Value<double?> heading,
  Value<double?> speed,
  required int timestamp,
});
typedef $$OfficerPathPointsTableUpdateCompanionBuilder
    = OfficerPathPointsCompanion Function({
  Value<int> id,
  Value<String> sessionId,
  Value<double> latitude,
  Value<double> longitude,
  Value<double?> altitude,
  Value<double?> accuracy,
  Value<double?> heading,
  Value<double?> speed,
  Value<int> timestamp,
});

class $$OfficerPathPointsTableFilterComposer
    extends Composer<_$ScsiDatabase, $OfficerPathPointsTable> {
  $$OfficerPathPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get altitude => $composableBuilder(
      column: $table.altitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$OfficerPathPointsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $OfficerPathPointsTable> {
  $$OfficerPathPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get altitude => $composableBuilder(
      column: $table.altitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heading => $composableBuilder(
      column: $table.heading, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$OfficerPathPointsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $OfficerPathPointsTable> {
  $$OfficerPathPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get altitude =>
      $composableBuilder(column: $table.altitude, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<double> get heading =>
      $composableBuilder(column: $table.heading, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$OfficerPathPointsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $OfficerPathPointsTable,
    OfficerPathPointRecord,
    $$OfficerPathPointsTableFilterComposer,
    $$OfficerPathPointsTableOrderingComposer,
    $$OfficerPathPointsTableAnnotationComposer,
    $$OfficerPathPointsTableCreateCompanionBuilder,
    $$OfficerPathPointsTableUpdateCompanionBuilder,
    (
      OfficerPathPointRecord,
      BaseReferences<_$ScsiDatabase, $OfficerPathPointsTable,
          OfficerPathPointRecord>
    ),
    OfficerPathPointRecord,
    PrefetchHooks Function()> {
  $$OfficerPathPointsTableTableManager(
      _$ScsiDatabase db, $OfficerPathPointsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfficerPathPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfficerPathPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfficerPathPointsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<double?> altitude = const Value.absent(),
            Value<double?> accuracy = const Value.absent(),
            Value<double?> heading = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            Value<int> timestamp = const Value.absent(),
          }) =>
              OfficerPathPointsCompanion(
            id: id,
            sessionId: sessionId,
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            accuracy: accuracy,
            heading: heading,
            speed: speed,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sessionId,
            required double latitude,
            required double longitude,
            Value<double?> altitude = const Value.absent(),
            Value<double?> accuracy = const Value.absent(),
            Value<double?> heading = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            required int timestamp,
          }) =>
              OfficerPathPointsCompanion.insert(
            id: id,
            sessionId: sessionId,
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            accuracy: accuracy,
            heading: heading,
            speed: speed,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfficerPathPointsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $OfficerPathPointsTable,
    OfficerPathPointRecord,
    $$OfficerPathPointsTableFilterComposer,
    $$OfficerPathPointsTableOrderingComposer,
    $$OfficerPathPointsTableAnnotationComposer,
    $$OfficerPathPointsTableCreateCompanionBuilder,
    $$OfficerPathPointsTableUpdateCompanionBuilder,
    (
      OfficerPathPointRecord,
      BaseReferences<_$ScsiDatabase, $OfficerPathPointsTable,
          OfficerPathPointRecord>
    ),
    OfficerPathPointRecord,
    PrefetchHooks Function()>;
typedef $$ReportsTableCreateCompanionBuilder = ReportsCompanion Function({
  required String id,
  required String caseId,
  required int generatedAt,
  required String filePath,
  required String sha256,
  required int sizeBytes,
  Value<bool?> passwordProtected,
  Value<int> rowid,
});
typedef $$ReportsTableUpdateCompanionBuilder = ReportsCompanion Function({
  Value<String> id,
  Value<String> caseId,
  Value<int> generatedAt,
  Value<String> filePath,
  Value<String> sha256,
  Value<int> sizeBytes,
  Value<bool?> passwordProtected,
  Value<int> rowid,
});

class $$ReportsTableFilterComposer
    extends Composer<_$ScsiDatabase, $ReportsTable> {
  $$ReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get passwordProtected => $composableBuilder(
      column: $table.passwordProtected,
      builder: (column) => ColumnFilters(column));
}

class $$ReportsTableOrderingComposer
    extends Composer<_$ScsiDatabase, $ReportsTable> {
  $$ReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseId => $composableBuilder(
      column: $table.caseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sha256 => $composableBuilder(
      column: $table.sha256, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get passwordProtected => $composableBuilder(
      column: $table.passwordProtected,
      builder: (column) => ColumnOrderings(column));
}

class $$ReportsTableAnnotationComposer
    extends Composer<_$ScsiDatabase, $ReportsTable> {
  $$ReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<int> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<bool> get passwordProtected => $composableBuilder(
      column: $table.passwordProtected, builder: (column) => column);
}

class $$ReportsTableTableManager extends RootTableManager<
    _$ScsiDatabase,
    $ReportsTable,
    ReportRecord,
    $$ReportsTableFilterComposer,
    $$ReportsTableOrderingComposer,
    $$ReportsTableAnnotationComposer,
    $$ReportsTableCreateCompanionBuilder,
    $$ReportsTableUpdateCompanionBuilder,
    (ReportRecord, BaseReferences<_$ScsiDatabase, $ReportsTable, ReportRecord>),
    ReportRecord,
    PrefetchHooks Function()> {
  $$ReportsTableTableManager(_$ScsiDatabase db, $ReportsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> caseId = const Value.absent(),
            Value<int> generatedAt = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> sha256 = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<bool?> passwordProtected = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportsCompanion(
            id: id,
            caseId: caseId,
            generatedAt: generatedAt,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            passwordProtected: passwordProtected,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String caseId,
            required int generatedAt,
            required String filePath,
            required String sha256,
            required int sizeBytes,
            Value<bool?> passwordProtected = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportsCompanion.insert(
            id: id,
            caseId: caseId,
            generatedAt: generatedAt,
            filePath: filePath,
            sha256: sha256,
            sizeBytes: sizeBytes,
            passwordProtected: passwordProtected,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReportsTableProcessedTableManager = ProcessedTableManager<
    _$ScsiDatabase,
    $ReportsTable,
    ReportRecord,
    $$ReportsTableFilterComposer,
    $$ReportsTableOrderingComposer,
    $$ReportsTableAnnotationComposer,
    $$ReportsTableCreateCompanionBuilder,
    $$ReportsTableUpdateCompanionBuilder,
    (ReportRecord, BaseReferences<_$ScsiDatabase, $ReportsTable, ReportRecord>),
    ReportRecord,
    PrefetchHooks Function()>;

class $ScsiDatabaseManager {
  final _$ScsiDatabase _db;
  $ScsiDatabaseManager(this._db);
  $$CasesTableTableManager get cases =>
      $$CasesTableTableManager(_db, _db.cases);
  $$RecordingSessionsTableTableManager get recordingSessions =>
      $$RecordingSessionsTableTableManager(_db, _db.recordingSessions);
  $$VideoSegmentsTableTableManager get videoSegments =>
      $$VideoSegmentsTableTableManager(_db, _db.videoSegments);
  $$EvidenceItemsTableTableManager get evidenceItems =>
      $$EvidenceItemsTableTableManager(_db, _db.evidenceItems);
  $$DetectionsTableTableManager get detections =>
      $$DetectionsTableTableManager(_db, _db.detections);
  $$AuditEventsTableTableManager get auditEvents =>
      $$AuditEventsTableTableManager(_db, _db.auditEvents);
  $$TimelineEntriesTableTableManager get timelineEntries =>
      $$TimelineEntriesTableTableManager(_db, _db.timelineEntries);
  $$OfficerPathPointsTableTableManager get officerPathPoints =>
      $$OfficerPathPointsTableTableManager(_db, _db.officerPathPoints);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
}
