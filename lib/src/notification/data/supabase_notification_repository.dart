




import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/notification/data/notification_repository.dart';
import 'package:takafol/src/notification/domain/notification.dart';
part 'supabase_notification_repository.g.dart';
@riverpod
NotificationRepository notificationRepository(NotificationRepositoryRef ref)=>SupabaseNotificatioRepository(Supabase.instance.client);
class SupabaseNotificatioRepository implements NotificationRepository{
    SupabaseClient supabaseClient;
SupabaseNotificatioRepository(this.supabaseClient);
  @override
  Future<void> create(AppNotification notification) async{
     final body = notification.toJson();
      body.remove("id");
      body.remove("created_at");
    
    await supabaseClient.from(Tabels.notification).insert(body);
  }

  @override
  Stream<List<AppNotification>> streamMyNotification(String userId, int limit) {
    final query = supabaseClient.from(Tabels.notification)
    .select<PostgrestList>()
    .eq("refreanceId", userId)
    .limit(limit)
    .order("created_at",ascending: false)
    .asStream();
    
   return query .map((e) => e.map((e) => AppNotification.fromJson(e) ).toList());
    
    
  }

  @override
  Future<void> update(AppNotification notification)async {
    try {
      await supabaseClient
          .from(Tabels.notification)
        
          .update(notification.toJson())
          .eq("id", notification.id)
          
          .single();
    } catch (e) {
      rethrow;
    }
  }

}