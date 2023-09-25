


import 'package:takafol/src/notification/domain/notification.dart';

abstract class NotificationRepository{
  Future<void>  create(AppNotification notification);
  Future<void> update(AppNotification notification);
   Stream<List<AppNotification>>  streamMyNotification(String userId,int limit);

}