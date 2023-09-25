
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/needy_mangement/presentation/components/needy_navbar_component.dart';

class NeedyScaffoldWithNavBarPage extends ConsumerWidget {
  const NeedyScaffoldWithNavBarPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
