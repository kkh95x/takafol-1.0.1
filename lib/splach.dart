import 'package:flutter/material.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  static String get routeName => "splash";
  static String get routePath => "/$routeName";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoadingComponent(),),
    );
  }
}