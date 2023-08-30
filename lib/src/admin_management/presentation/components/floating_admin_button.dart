import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:takafol/src/admin_management/presentation/components/add_needy_component.dart';
import 'package:takafol/src/core/presentation/components/float_button_component.dart';

class FloatingAdminButtonComponent extends StatelessWidget {
  const FloatingAdminButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatButtonComponent(icon: Icons.add, speedDialChildren: [
      SpeedDialChild(
          label: "إضافة محتاج",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.red,
          child: const Icon(Icons.person),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content:  AddNeedyComponent(),
                );
              },
            );
          }),
      SpeedDialChild(
          label: "إضافة جامع بيانات",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.green,
          child: const Icon(Icons.person),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(content: const Text("قريباَ"), actions: [
                      ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("رجوع"))
                    ]));
          })
    ]);
  }
}
