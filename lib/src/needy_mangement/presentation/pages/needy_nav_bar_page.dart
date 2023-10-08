
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/needy_mangement/presentation/components/needy_navbar_component.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bot_toast/bot_toast.dart';

class NeedyScaffoldWithNavBarPage extends ConsumerWidget {
  const NeedyScaffoldWithNavBarPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
         final user=ref.read(authNotiferProvider).currentUser;
    if(user!=null){
       Supabase.instance.client.realtime.channel('public:${Tabels.notification}').on(RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: 'INSERT', schema: 'public', table: Tabels.notification,),
    (payload, [ref]) async{
      if(payload["refreanceId"]==user.id){
      BotToast.showSimpleNotification(title: payload['title']??"",subTitle: payload['body']??"");
}

     }).subscribe();}
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          child,
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: NeedyBottomNavbarComponent(),
          ),
        ],
      ),
    );
  }
}
