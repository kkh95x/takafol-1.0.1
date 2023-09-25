// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'notification.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'notification.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
   String?id,
   required String title,
  required String body,
   // ignore: non_constant_identifier_names
   DateTime? created_at,
   required UserInformation from,
   required String refreanceId,
   required NotificationType type,
  @Default(NotificationState.usSeen)  NotificationState state,
   required String extra
   
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, Object?> json)
      => _$AppNotificationFromJson(json);
}

enum NotificationType{
  chat,
  donation
}
enum NotificationState{
  seen,
  usSeen
}