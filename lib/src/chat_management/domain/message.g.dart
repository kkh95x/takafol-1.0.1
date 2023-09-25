// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String?,
      chatId: json['chatId'] as String,
      text: json['text'] as String?,
      fileUrl: json['fileUrl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      senderId: json['senderId'] as String,
      sendDate: DateTime.parse(json['sendDate'] as String),
      recivedDate: json['recivedDate'] == null
          ? null
          : DateTime.parse(json['recivedDate'] as String),
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      messageStatus:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['messageStatus']) ??
              MessageStatus.send,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'text': instance.text,
      'fileUrl': instance.fileUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'created_at': instance.created_at?.toIso8601String(),
      'senderId': instance.senderId,
      'sendDate': instance.sendDate.toIso8601String(),
      'recivedDate': instance.recivedDate?.toIso8601String(),
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'messageStatus': _$MessageStatusEnumMap[instance.messageStatus]!,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.voice: 'voice',
  MessageType.image: 'image',
  MessageType.point: 'point',
};

const _$MessageStatusEnumMap = {
  MessageStatus.send: 'send',
  MessageStatus.recived: 'recived',
  MessageStatus.created: 'created',
};
