// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      id: json['id'] as String?,
      sender: UserInformation.fromJson(json['sender'] as Map<String, dynamic>),
      recive: UserInformation.fromJson(json['recive'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'recive': instance.recive,
      'lastMessage': instance.lastMessage,
    };
