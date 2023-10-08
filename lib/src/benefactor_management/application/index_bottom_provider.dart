import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/donations_page.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/map_page.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/profile_benefor_page.dart';
import 'package:takafol/src/notification/presentation/notification_page.dart';

final benefactorGlobalKey=
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());
  

final benefactorBottomNavigationIndexProvider =
    StateNotifierProvider.autoDispose<StateBottom, int>((ref) {
  final globalStateNave = ref.read(benefactorGlobalKey);
  return StateBottom(globalKeyNav: globalStateNave);
});

class StateBottom extends StateNotifier<int> {
  StateBottom({required this.globalKeyNav}) : super(2);
  GlobalKey<NavigatorState> globalKeyNav;
  void updateIndex(int index) {
    state = index;
    switch (index) {
      // case 0:
      //   globalKeyNav.currentState?.context.go("/benefactor${BenefactorHomePage.routePath}");
      //   break;
      case 0:
        globalKeyNav.currentState?.context
            .go("/benefactor${ProfileBeneforPage.routePath}");

        break;
      case 1:
        globalKeyNav.currentState?.context.go("/benefactor${NotificationPage.routePath}");
        break;
      case 2:
        globalKeyNav.currentState?.context
            .go("/benefactor${BenefactorMapPage.routePath}");

        break;
      case 3:
        globalKeyNav.currentState?.context
            .go( "/benefactor${BeneFactorDonationsPage.routePath}");
        break;
      // case 5:
      //   globalKeyNav.currentState?.context.go("/benefactor${BenefactorHomePage.routePath}");
      //   break;
      // case 6:
      //   globalKeyNav.currentState?.context.go("/benefactor${BenefactorHomePage.routePath}");
      //   break;
      // Set default page to profile
      default:
        globalKeyNav.currentState?.context
            .go("/benefactor${ProfileBeneforPage.routePath}");
    }
  }
}

