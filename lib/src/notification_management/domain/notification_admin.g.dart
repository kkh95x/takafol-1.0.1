// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationAdmin _$$_NotificationAdminFromJson(Map<String, dynamic> json) =>
    _$_NotificationAdmin(
      id: json['id'] as String?,
      admin: UserInformation.fromJson(json['admin'] as Map<String, dynamic>),
      title: json['title'] as String,
      body: json['body'] as String,
      date: DateTime.parse(json['date'] as String),
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
    );

Map<String, dynamic> _$$_NotificationAdminToJson(
        _$_NotificationAdmin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'admin': instance.admin,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date.toIso8601String(),
      'accountType': _$AccountTypeEnumMap[instance.accountType],
    };

const _$AccountTypeEnumMap = {
  AccountType.needy: 'needy',
  AccountType.benfactor: 'benfactor',
  AccountType.admin: 'admin',
};
