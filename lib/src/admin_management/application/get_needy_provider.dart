import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
// import 'package:takafol/src/user_management/data/parse_server/supabase_app_user_repository.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
// import 'package:takafol/src/user_management/data/supabase_app_user_repository.dart';

final getNeedyStream =
    StateNotifierProvider<GetNeedyAdminProvider, AsyncValue<List<AppUser>?>>(
  (ref) => GetNeedyAdminProvider(ref, Supabase.instance.client)..init(),
);

class GetNeedyAdminProvider extends StateNotifier<AsyncValue<List<AppUser>?>> {
  GetNeedyAdminProvider(this.ref, this.supabaseClient)
      : super(const AsyncLoading());
  SupabaseClient supabaseClient;
  Ref ref;
  void init() async {
    state = const AsyncLoading();
    final user = ref.read(authNotiferProvider).currentUser;
    try {
      final data = await ref
          .read(appUserRepositoryProvider)
          .getNeedyByCreatorId(user?.id ?? "");
      state = AsyncData(data);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }

    // final chanel = supabaseClient.realtime.channel("${user?.id}-myNeedy");
    // chanel.on(
    //     RealtimeListenTypes.postgresChanges,
    //     ChannelFilter(
    //         event: "*",
    //         filter: "creatorId=eq.${user?.id}",
    //         schema: "public"), (payload, [ref]) async {
    //   final data = await ref
    //       .read(appUserRepositoryProvider)
    //       .getNeedyByCreatorId(user?.id ?? "");
    //   state =const AsyncLoading();
    //   state = AsyncData(data);
    // }).subscribe();
  }
}
