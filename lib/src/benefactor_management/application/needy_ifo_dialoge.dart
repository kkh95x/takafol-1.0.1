// ignore_for_file: use_build_context_synchronously

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/benefactor_management/presentation/components/needy_inof_component.dart';
import 'package:takafol/src/benefactor_management/presentation/components/selecte_donation_component.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/presentaion/components/add_donation_component.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

class NeedyInfoDialogeProvider {
  BuildContext context;
  AppUser appUser;
  NeedyInfoDialogeProvider({required this.appUser, required this.context});
}

final needyInfoDialogeProvider = FutureProvider.autoDispose
    .family<void, NeedyInfoDialogeProvider>((ref, input) async {
  final needy = input.appUser;
  await showDialog(
    context: input.context,
    builder: (context) {
      return AlertDialog(
        title: const Column(
          children: [Text("بيانات المستخدم"), Divider()],
        ),
        content: NeedyInfoComponent(needyUser: needy),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                context.pop();
              },
              child: const Text("إغلاق")),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () async {


                BotToast.showCustomLoading(
                    toastBuilder: (cancelFunc) => const LoadingComponent());
                final isHaveDonations = await ref
                    .read(donationRepositoryProvider)
                    .isHaveCreatedDonations(
                        ref.read(authNotiferProvider).currentUser?.id ?? "-");

                if (isHaveDonations) {
                  showDialog(
                    context: input.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Column(
                          children: [Text("تحديد التبرع"), Divider()],
                        ),
                        content: SelectDonationComponent(needy: needy),
                      );
                    },
                  );
                } else {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: const Column(
                              children: [Text("إنشاء تبرع جديد"), Divider()],
                            ),
                            content: const Text(
                                "ليس لديك تبرعات جاهزةللإرسال, هل تريد إنشاء تبرع جديد؟"),
                            actions: [
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red)),
                                  onPressed: () {
                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  },
                                  child: const Text("لا")),
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Column(
                                            children: [
                                              Text("إنشاء تبرع جديد"),
                                              Divider()
                                            ],
                                          ),
                                          content: SizedBox(
                                              width: double.maxFinite,
                                              child: AddDonationComponent(
                                                needy: needy,
                                              )),
                                        );
                                      },
                                    ).then((value) {
                                      context.pop();
                                    });
                                  },
                                  child: const Text("نعم")),
                            ]);
                      });
                }
                // context.pop();
              },
              child: const Text("إرسال تبرع"))
        ],
      );
    },
  );
});
