import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/admin_management/presentation/components/admin_nav_bar.dart';

class AdminScaffoldWithNavBarPage extends ConsumerWidget {
  const AdminScaffoldWithNavBarPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AdminBottomNavbarComponent(),
          ),
        ],
      ),
    );
  }
}
