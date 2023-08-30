// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'needy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Needy _$$_NeedyFromJson(Map<String, dynamic> json) => _$_Needy(
      needyNumber: json['needyNumber'] as String,
      gName: json['gName'] as String,
      gSName: json['gSName'] as String,
      gLName: json['gLName'] as String,
      gBirthDay: json['gBirthDay'] == null
          ? null
          : DateTime.parse(json['gBirthDay'] as String),
      gIdType: json['gIdType'] as String,
      gIdnumber: json['gIdnumber'] as String,
      zFName: json['zFName'] as String?,
      zSName: json['zSName'] as String?,
      zLName: json['zLName'] as String?,
      zBirthDay: json['zBirthDay'] == null
          ? null
          : DateTime.parse(json['zBirthDay'] as String),
      boy02: json['boy02'] as int?,
      girl02: json['girl02'] as int?,
      boy210: json['boy210'] as int?,
      girl210: json['girl210'] as int?,
      boy1020: json['boy1020'] as int?,
      girl020: json['girl020'] as int?,
      boy2040: json['boy2040'] as int?,
      gir2040: json['gir2040'] as int?,
      boy40: json['boy40'] as int?,
      gir40: json['gir40'] as int?,
      orphans: json['orphans'] as int?,
      specialNeeds: json['specialNeeds'] as int?,
    );

Map<String, dynamic> _$$_NeedyToJson(_$_Needy instance) => <String, dynamic>{
      'needyNumber': instance.needyNumber,
      'gName': instance.gName,
      'gSName': instance.gSName,
      'gLName': instance.gLName,
      'gBirthDay': instance.gBirthDay?.toIso8601String(),
      'gIdType': instance.gIdType,
      'gIdnumber': instance.gIdnumber,
      'zFName': instance.zFName,
      'zSName': instance.zSName,
      'zLName': instance.zLName,
      'zBirthDay': instance.zBirthDay?.toIso8601String(),
      'boy02': instance.boy02,
      'girl02': instance.girl02,
      'boy210': instance.boy210,
      'girl210': instance.girl210,
      'boy1020': instance.boy1020,
      'girl020': instance.girl020,
      'boy2040': instance.boy2040,
      'gir2040': instance.gir2040,
      'boy40': instance.boy40,
      'gir40': instance.gir40,
      'orphans': instance.orphans,
      'specialNeeds': instance.specialNeeds,
    };
