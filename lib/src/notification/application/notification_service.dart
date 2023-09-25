

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:takafol/src/notification/data/notification_repository.dart';
import 'package:takafol/src/notification/data/supabase_notification_repository.dart';
import 'package:takafol/src/notification/domain/notification.dart';
import 'package:takafol/src/user_management/data/supabase/app_user_repository.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';

part 'notification_service.g.dart';
@riverpod
NotificationService notificationService(NotificationServiceRef ref)=>NotificationService(ref.read(notificationRepositoryProvider),FirebaseMessaging.instance,ref.read(appUserRepositoryProvider));
class NotificationService{
  NotificationService(this.notificationRepository,this.firebaseMessaging,this.appUserRepository);
  FirebaseMessaging firebaseMessaging;
  NotificationRepository notificationRepository;
  AppUserRepository appUserRepository;
  
  Future<void>createNotification(AppNotification notification)async{
  await notificationRepository.create(notification);
  final token=await appUserRepository.getTokenById(notification.refreanceId);

  if(token!=null){
  await firebaseMessaging.sendMessage(
    to: token,
    messageId: "${Random().nextInt(10000)}",
    collapseKey: "sa",
    messageType: "123",
    ttl:1000000,    
    data: {
      "title":notification.title,
      "body":notification.body
    }
  );

  }


  }
    Future <void> setNotificationAsSeen(AppNotification notification)async{
    await notificationRepository.update(notification.copyWith(state: NotificationState.seen));
  }
}