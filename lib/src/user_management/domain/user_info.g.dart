// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInformation _$$_UserInformationFromJson(Map<String, dynamic> json) =>
    _$_UserInformation(
      id: json['id'] as String?,
      name: json['name'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      imageUrl: json['imageUrl'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
    );

Map<String, dynamic> _$$_UserInformationToJson(_$_UserInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'imageUrl': instance.imageUrl,
      'birthDay': instance.birthDay?.toIso8601String(),
    };

const _$AccountTypeEnumMap = {
  AccountType.needy: 'needy',
  AccountType.benfactor: 'benfactor',
  AccountType.admin: 'admin',
};
