// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppNotification _$$_AppNotificationFromJson(Map<String, dynamic> json) =>
    _$_AppNotification(
      id: json['id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      from: UserInformation.fromJson(json['from'] as Map<String, dynamic>),
      refreanceId: json['refreanceId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      state: $enumDecodeNullable(_$NotificationStateEnumMap, json['state']) ??
          NotificationState.usSeen,
      extra: json['extra'] as String,
    );

Map<String, dynamic> _$$_AppNotificationToJson(_$_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.created_at?.toIso8601String(),
      'from': instance.from,
      'refreanceId': instance.refreanceId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'state': _$NotificationStateEnumMap[instance.state]!,
      'extra': instance.extra,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.chat: 'chat',
  NotificationType.donation: 'donation',
};

const _$NotificationStateEnumMap = {
  NotificationState.seen: 'seen',
  NotificationState.usSeen: 'usSeen',
};
