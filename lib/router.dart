import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:takafol/src/admin_management/application/index_nav_provider.dart';
import 'package:takafol/src/admin_management/domain/admin_enum.dart';
import 'package:takafol/src/admin_management/presentation/pages/add_needy_page.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_alll_needy_page.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_home_page.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_nav_page.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_profile_page.dart';
import 'package:takafol/src/benefactor_management/application/index_bottom_provider.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/benefactor_home_page.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/benefactor_nave_bar.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/donations_page.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/map_page.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/profile_benefor_page.dart';
import 'package:takafol/src/chat_management/presentation/pages/donation_messages_page.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/auth/auth_state.dart';
import 'package:takafol/src/donations_mangement/application/donation_providers.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/presentaion/pages/donation_detals_page.dart';
import 'package:takafol/src/needy_mangement/application/index_botom_state.dart';
import 'package:takafol/src/needy_mangement/presentation/pages/needy_donations_page.dart';
import 'package:takafol/src/needy_mangement/presentation/pages/needy_nav_bar_page.dart';
import 'package:takafol/src/needy_mangement/presentation/pages/needy_profile.dart';
import 'package:takafol/src/notification/presentation/notification_page.dart';
import 'package:takafol/src/sigin_management/presentation/pages/siginin_page.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'testing.dart';
import 'splach.dart';

final _keyRoute = GlobalKey<NavigatorState>();
final routerProvider = StateProvider<GoRouter>((ref) {
  final auth = ref.watch(authNotiferProvider);
  final benefactor = ref.read(benefactorGlobalKey);
  final admin = ref.read(adminGlobalKey);
   final needy=ref.read(needyGlobalKey);
  return GoRouter(
    
      navigatorKey:_keyRoute,
      initialLocation: Splash.routePath,
      observers: [BotToastNavigatorObserver()],
      routes: [
        //AddNeedyPage
        GoRoute(
          path: Testing.routePath,
          name: Testing.routeName,
          parentNavigatorKey: _keyRoute,
          builder: (context, state) => const Testing(),
        ),
          GoRoute(
          path: AddNeedyPage.routePath,
          name: AddNeedyPage.routeName,
          parentNavigatorKey: _keyRoute,
          builder: (context, state) => const AddNeedyPage(),
        ),
        GoRoute(
          path: SginInPage.routePath,
          name: SginInPage.routeName,
          parentNavigatorKey: _keyRoute,
          builder: (context, state) => const SginInPage(),
        ),
        GoRoute(
          path: Splash.routePath,
          name: Splash.routeName,
          parentNavigatorKey: _keyRoute,
          builder: (context, state) => const Splash(),
        ),
        // GoRoute(
        //   path: DonationDetalsPage.routPath,
        //   name: DonationDetalsPage.routName,
        //   builder: (context, state) {

        //     return  DonationDetalsPage(donationId: state.extra?.toString() ?? "");
        //   }
        //      ,
        // ),
        ShellRoute(
            navigatorKey: benefactor,
            builder: (context, state, child) =>
                BenefactorScaffoldWithNavBarPage(child: child),
            routes: [
              GoRoute(
                parentNavigatorKey: benefactor,
                path: "/benefactor${BenefactorHomePage.routePath}",
                name: BenefactorHomePage.routeName,
                builder: (context, state) => const BenefactorHomePage(),
              ),
               GoRoute(
                parentNavigatorKey: benefactor,
                path: "/benefactor${ProfileBeneforPage.routePath}",
                name: ProfileBeneforPage.routeName,
                builder: (context, state) => const ProfileBeneforPage(),
              ),
               GoRoute(
                parentNavigatorKey: benefactor,
                path: "/benefactor${NotificationPage.routePath}",
                name:"benefactor-${NotificationPage.routeName}",
                builder: (context, state) => const NotificationPage(),
              ),
              GoRoute(
                parentNavigatorKey:benefactor ,
          path: "/benefactor${DonationDetalsPage.routePath}",
          name: "benefactor-${DonationDetalsPage.routeName}",
          builder: (context, state) {

            return  DonationDetalsPage(donationId: state.extra?.toString() ?? "");
          }
             ,
        ),
              GoRoute(
                
                parentNavigatorKey: benefactor,
                path: "/benefactor${BenefactorMapPage.routePath}",
                name: BenefactorMapPage.routeName,
                builder: (context, state) => const BenefactorMapPage(),
              ),
              GoRoute(
                parentNavigatorKey: benefactor,
                path: "/benefactor${BeneFactorDonationsPage.routePath}",
                name: BeneFactorDonationsPage.routeName,
                builder: (context, state) => const BeneFactorDonationsPage(),
              ),
            ]),
        ShellRoute(
        
            navigatorKey: admin,
            builder: (context, state, child) =>
                AdminScaffoldWithNavBarPage(child: child),
            routes: [
              GoRoute(
                path: "/admin${AdminHomePage.routePath}",
                name: AdminHomePage.routeName,
                parentNavigatorKey: admin,
                builder: (context, state) => const AdminHomePage(),
              ),
               GoRoute(
                path: "/admin${AdminNeedyHomePage.routePath}",
                name: AdminNeedyHomePage.routeName,
                parentNavigatorKey: admin,
                builder: (context, state) => const AdminNeedyHomePage(),
              ),
               GoRoute(
                path: "/admin${AdminProfile.routePath}",
                name: AdminProfile.routeName,
                parentNavigatorKey: admin,
                builder: (context, state) => const AdminProfile(),
              ),
            ]),
          ShellRoute(
        
            navigatorKey: needy,
            builder: (context, state, child) =>
                NeedyScaffoldWithNavBarPage(child: child),
            routes: [
               GoRoute(
                parentNavigatorKey: needy,
                path: "/needy${NotificationPage.routePath}",
                name:"needy-${NotificationPage.routeName}",
                builder: (context, state) => const NotificationPage(),
              ),
              GoRoute(
                path: "/needy${NeedyProfile.routePath}",
                name: NeedyProfile.routeName,
                builder: (context, state) => const NeedyProfile(),
              ),
                GoRoute(
                path: "/needy${NeedyDonationsPage.routePath}",
                name: "needy-${NeedyDonationsPage.routeName}",
                builder: (context, state) => const NeedyDonationsPage(),
              ),
               GoRoute(
          path: "/needy${DonationDetalsPage.routePath}",
          name: DonationDetalsPage.routeName,
          builder: (context, state) {

            return  DonationDetalsPage(donationId: state.extra?.toString() ?? "");
          }
             ,
        ),
            ]),
        GoRoute
        (path: DonationMessagesPage.routePath,
        parentNavigatorKey: _keyRoute,
        name: DonationMessagesPage.routeName,
        builder: (context, state) => DonationMessagesPage(donation: (state.extra as Donation)),)
      ],
      redirect: (context, state) {
        if (auth.state == AuthStatus.loading) {
          return null;
        }
        final isAuth = auth.state == AuthStatus.auth;
        final isSplsh = state.fullPath == Splash.routePath;
        if (isSplsh) {
          if (isAuth) {
            switch (auth.currentUser?.accountType) {
              case AccountType.needy:
               return "/needy${NeedyDonationsPage.routePath}";
              case AccountType.benfactor:
                return "/benefactor${BenefactorHomePage.routePath}";

              case AccountType.admin:
                switch (auth.currentUser?.admin?.adminType) {
                  case AdminType.dataEntry:
                    // TODO: Handle this case.
                    break;
                  case AdminType.administration:
                    return "/admin${AdminHomePage.routePath}";

                  default:
                    return null;
                }
                break;
              default:
                return SginInPage.routePath;
            }
          }
        }
        final isLoginin = state.fullPath == SginInPage.routePath;
        if (isLoginin) {
          if (isAuth) {
            switch (auth.currentUser?.accountType) {
              case AccountType.needy:
                //TODO hande this for needy
                break;
              case AccountType.benfactor:
                return "/benefactor${ProfileBeneforPage.routePath}";

              case AccountType.admin:
                switch (auth.currentUser?.admin?.adminType) {
                  case AdminType.dataEntry:
                    // TODO: Handle this case.
                    break;
                  case AdminType.administration:
                    return "/admin${AdminHomePage.routePath}";

                  default:
                    return null;
                }
                break;
              default:
                return SginInPage.routePath;
            }
          }
        }
        return isAuth ? null : SginInPage.routePath;
      });
});
