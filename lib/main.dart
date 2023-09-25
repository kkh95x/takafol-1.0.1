import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supaUrl,
    anonKey: supaKey,
  );
    await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);


  runApp(const ProviderScope(child: MyApp()));
}



class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final botToastBuilder = BotToastInit();
    final user=ref.read(authNotiferProvider).currentUser;
    if(user!=null){
       Supabase.instance.client.realtime.channel('public:${Tabels.notification}').on(RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: 'INSERT', schema: 'public', table: Tabels.notification,filter:"refreanceId=e.${user.id}" ),
    (payload, [ref]) async{
      BotToast.showSimpleNotification(title: payload['title'],subTitle: payload['body']);


     }).subscribe();

}
    
   

    return ScreenUtilInit(
        designSize: const Size(1080, 2340),
        minTextAdapt: true,
        splitScreenMode: true,
      //  scaleByHeight: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
              scrollBehavior: const MaterialScrollBehavior(
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
  ),

            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AE'),
            ],
            routerConfig: router,
            builder: (context, child) {
              child = botToastBuilder(context, child);
              return child;
            },
          );
        });
  }
}
// Future<bool> hasUserLogged() async {
//   ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
//   if (currentUser == null) {
//     return false;
//   }
//   //Checks whether the user's session token is valid
//   final ParseResponse? parseResponse =
//       await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

//   if (parseResponse?.success == null || !parseResponse!.success) {
//     //Invalid session. Logout
//     await currentUser.logout();
//     return false;
//   } else {
//     return true;
//   }
// }
//   final supa= SupabaseClient(
//     // realtimeClientOptions: RealtimeClientOptions(),

//      supaUrl,
//      ,
//   authFlowType: AuthFlowType.implicit,

//   );
//   final stream= supa.from("donations")
//   .asStream()
//   .where((event) {
// print("---? event ${event}");
// return true;
//   });
// stream.listen((event) {
//   print("---? event ${event}");
// ;
// },);

  // await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //     clientKey: keyClientKey, autoSendSessionId: true);

  // final user =
  // ParseUser.createUser("username", "password", "karimkhatib09@gmail.com");
  // final response = await user.se();
  // response.result;
  // final user = User(
  //     firstName: "firstName",
  //     lastName: "lastName",
  //     username: "username",
  //     password: "password",
  //     isOnline: true,
  //     accountType: "accountType",
  //     isActive: true);
  // final user2 = User(
  //     firstName: "firstName",
  //     lastName: "lastName",
  //     username: "username",
  //     password: "password",
  //     isOnline: true,
  //     accountType: "accountType",
  //     isActive: true);
  // final user3 = User(
  //     firstName: "firstName",
  //     lastName: "lastName",
  //     username: "username",
  //     password: "password",
  //     isOnline: true,
  //     accountType: "accountType",
  //     isActive: true);

  // await user.save();
  // await user2.save();
  // await user3.save();
  // final ads = Ads(content: "djsdhjsdhf", usersLiked: [user, user2, user3]);
  // await ads.save();

  // await hasUserLogged(); class Ads extends ParseObject implements ParseCloneable, EquatableMixin {
//   static const String _keyTableName = "ads";

// //   Ads({
//     String? objectId,
//     required String content,
//     required List<User> usersLiked,
//   }) : super(_keyTableName) {
//     if (objectId != null) {
//       this.objectId = objectId;
//     }
//     set<String>('content', content);

//     set<List<User>?>('usersLiked', usersLiked);
//   }
//   Ads.clone() : this(content: "", usersLiked: []);

//   @override
//   Ads clone(Map<String, dynamic> map) => Ads.clone()..fromJson(map);
//   String get content => get<String>('content') ?? "";
//   List<User> get userLiked => get<List<User>>("userLiked") ?? [];

//   // set<ParseFileBase?>('photo', photo);

//   @override
//   List<Object?> get props => [
//         content,
//         userLiked,
//       ];
//   @override
//   bool? get stringify => true;

//   Ads copyWith({
//     String? objectId,
//     String? content,
//     List<User>? userLiked,
//   }) {
//     return Ads(
//         content: content ?? this.content,
//         usersLiked: userLiked ?? this.userLiked,
//         objectId: objectId ?? this.objectId);
//   }
// }
