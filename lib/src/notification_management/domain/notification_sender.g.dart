// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_sender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationSender _$$_NotificationSenderFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationSender(
      title: json['title'] as String,
      id: json['id'] as String?,
      body: json['body'] as String,
      senderInfo:
          UserInformation.fromJson(json['senderInfo'] as Map<String, dynamic>),
      reciveId: json['reciveId'] as String,
    );

Map<String, dynamic> _$$_NotificationSenderToJson(
        _$_NotificationSender instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'body': instance.body,
      'senderInfo': instance.senderInfo,
      'reciveId': instance.reciveId,
    };
