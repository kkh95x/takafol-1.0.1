import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/admin_management/presentation/pages/admin_home_page.dart';

final adminGlobalKey=
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());
  

final benefactorBottomNavigationIndexProvider =
    StateNotifierProvider.autoDispose<StateBottom, int>((ref) {
  final globalStateNave = ref.read(adminGlobalKey);
  return StateBottom(globalKeyNav: globalStateNave);
});

class StateBottom extends StateNotifier<int> {
  StateBottom({required this.globalKeyNav}) : super(2);
  GlobalKey<NavigatorState> globalKeyNav;
  void updateIndex(int index) {
    state = index;
    switch (index) {
      case 0:
        globalKeyNav.currentState?.context.go("/admin${AdminHomePage.routePath}");
        break;
      case 1:
        globalKeyNav.currentState?.context
            .go("/admin${AdminHomePage.routePath}");

        break;
      case 2:
        globalKeyNav.currentState?.context.go("/admin${AdminHomePage.routePath}");
        break;
      case 3:
        globalKeyNav.currentState?.context
            .go("/admin${AdminHomePage.routePath}");

        break;
      case 4:
        globalKeyNav.currentState?.context
            .go("/admin${AdminHomePage.routePath}");
        // globalKeyNav.currentState?.context.go('/doctor${ProfileUserComponent.routeLocation}');
        break;
      case 5:
        globalKeyNav.currentState?.context.go("/admin${AdminHomePage.routePath}");
        break;
      case 6:
        globalKeyNav.currentState?.context.go("/admin${AdminHomePage.routePath}");
        break;
      // Set default page to profile
      default:
        globalKeyNav.currentState?.context
            .go("/admin${AdminHomePage.routePath}");
    }
  }
}

