import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:takafol/src/admin_management/presentation/components/add_needy_component.dart';
import 'package:takafol/src/core/presentation/components/float_button_component.dart';
import 'package:takafol/src/core/presentation/widgets/images_piker_widget.dart';
import 'package:takafol/src/donations_mangement/presentaion/components/add_donation_component.dart';

class FloatingBenefactorButtonComponent extends ConsumerWidget {
  const FloatingBenefactorButtonComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatButtonComponent(icon: Icons.add, speedDialChildren: [
      SpeedDialChild(
          label: "إنشاء تبرع جديد",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.red,
          child: const Icon(Icons.wallet_giftcard),
          onPressed: () async {
           await showDialog(
              context: context,
              
              builder: (context) {
                return const AlertDialog(
                  title: Column(
                    children: [Text("إنشاء تبرع جديد"), Divider()],
                  ),
                  content: SizedBox(
                      width: double.maxFinite, child: AddDonationComponent()),
                );
              },
            
            ).then((value) {
            
            });
          }),
      SpeedDialChild(
          label: "فلترةالبحث",
          closeSpeedDialOnPressed: true,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.green,
          child: const Icon(Icons.person),
          onPressed: () {
            ///TODO FIlter Search Of Needy Here
            // showDialog(
            //     context: context,
            //     builder: (context) =>
            //         AlertDialog(content: const Text("قريباَ"), actions: [
            //           ElevatedButton(
            //               onPressed: () {
            //                 context.pop();
            //               },
            //               child: const Text("رجوع"))
            //         ]));
          })
    ]);
  }
}
