import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_home_page.dart';
import 'package:takafol/src/needy_mangement/presentation/pages/needy_donations_page.dart';
import 'package:takafol/src/needy_mangement/presentation/pages/needy_profile.dart';
import 'package:takafol/src/notification/presentation/notification_page.dart';

final needyGlobalKey=
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());
  

final needyBottomNavigationIndexProvider =
    StateNotifierProvider.autoDispose<StateBottom, int>((ref) {
  final globalStateNave = ref.read(needyGlobalKey);
  return StateBottom(globalKeyNav: globalStateNave);
});

class StateBottom extends StateNotifier<int> {
  StateBottom({required this.globalKeyNav}) : super(2);
  GlobalKey<NavigatorState> globalKeyNav;
  void updateIndex(int index) {
    state = index;
    switch (index) {
        case 0:
        globalKeyNav.currentState?.context.go("/needy${NeedyProfile.routePath}");
        case 1:
        globalKeyNav.currentState?.context.go("/needy${NotificationPage.routePath}");
        break;
      case 2:
        globalKeyNav.currentState?.context.go("/needy${NeedyDonationsPage.routePath}");
        break;
      // case 3:
      //   globalKeyNav.currentState?.context
      //       .go("/needy${NeedyProfile.routePath}");

        // break;
    
      default:
        globalKeyNav.currentState?.context
            .go("/needy${NeedyProfile.routePath}");
    }
  }
}

