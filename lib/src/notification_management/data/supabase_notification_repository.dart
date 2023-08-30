


import 'notification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'supabase_notification_repository.g.dart';
@riverpod
NotificationRepository notificationRepository(NotificationRepositoryRef ref)=>SupabaseNodificationRepository();
class SupabaseNodificationRepository implements NotificationRepository{

}