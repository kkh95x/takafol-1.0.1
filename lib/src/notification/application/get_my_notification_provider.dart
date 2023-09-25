

import 'package:riverpod/riverpod.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/notification/data/supabase_notification_repository.dart';
import 'package:takafol/src/notification/domain/notification.dart';

final countIndexProvider=StateProvider((ref) => 1);
final getMyNotificationProvider=StateNotifierProvider<NotificationNotifire,AsyncValue<List<AppNotification>>>((ref) => NotificationNotifire(ref)..init());
class NotificationNotifire extends StateNotifier<AsyncValue<List<AppNotification>>>{
  NotificationNotifire(this.ref):super(const AsyncLoading());
Ref ref;

  Future<void> init() async{
    state =const AsyncLoading();
    try{
     final user=ref.read(authNotiferProvider).currentUser;
     final count=ref.watch(countIndexProvider);
    ref.read(notificationRepositoryProvider).streamMyNotification(user?.id??"", count*10).listen((event) {
       state = AsyncData(event);
    });

   
    }catch(e,stacl){
      state=AsyncError(e, stacl);
    }
  }

}