import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/benefactor_management/presentation/components/benefactor_bottom_nav_component.dart';

final showBottomBenecaftor=StateProvider((ref) => true);
class BenefactorScaffoldWithNavBarPage extends ConsumerWidget {
  const BenefactorScaffoldWithNavBarPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      // bottomNavigationBar:ref.watch(showBottomBenecaftor)? const BenefactorBottomNavbarComponent():null,
      body: Stack(
        children: [
          child,
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BenefactorBottomNavbarComponent(),
          ),
        ],
      ),
    );
  }
}
