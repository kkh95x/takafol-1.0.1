// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/chat_management/domain/message_type.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'message.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    String? id,
    required String chatId,
  String? text,
  String? fileUrl,
double?  latitude ,
double? longitude,
// required String benfactorId,
// required String dontionId,
required String senderId,
    required DateTime sendDate,
    DateTime? recivedDate,
    required MessageType messageType,
    @Default(MessageStatus.send) MessageStatus messageStatus,



   
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json)
      => _$MessageFromJson(json);
}