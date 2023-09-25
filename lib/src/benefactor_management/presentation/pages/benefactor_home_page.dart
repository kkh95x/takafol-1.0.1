import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';

class BenefactorHomePage extends ConsumerWidget {
  const BenefactorHomePage({super.key});
  static String get routeName => "benefactor-home";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("BenefactorHomePage"),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(authNotiferProvider.notifier).logout();
              },
              child: const Text("تسجيل الخروج"))
        ],
      ),
    );
  }
}
