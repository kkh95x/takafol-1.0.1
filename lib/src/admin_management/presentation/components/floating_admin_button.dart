import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:takafol/src/admin_management/application/get_needy_provider.dart';
import 'package:takafol/src/admin_management/presentation/components/add_needy_component.dart';
import 'package:takafol/src/admin_management/presentation/pages/add_needy_page.dart';
import 'package:takafol/src/core/presentation/components/float_button_component.dart';

class FloatingAdminButtonComponent extends ConsumerWidget {
  const FloatingAdminButtonComponent({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return FloatButtonComponent(icon: Icons.add, speedDialChildren: [
      SpeedDialChild(
          label: "إضافة محتاج",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.red,
          child: const Icon(Icons.person),
          onPressed: () async {
            // await showDialog(
            //   context: context,
            //   builder: (context) {
            //     return const AlertDialog(
            //       content:  AddNeedyComponent(),
            //     );
            //   },
            // );

            context.push(AddNeedyPage.routePath);
          }),
      SpeedDialChild(
          label: "تحديث الخريطة",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.green,
          child: const Icon(Icons.person),
          onPressed: () {
                                 ref.read(getNeedyStream.notifier).init();

          })
    ]);
  }
}
