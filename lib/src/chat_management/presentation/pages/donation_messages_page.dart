import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/benefactor_management/presentation/pages/donations_page.dart';
import 'package:takafol/src/chat_management/application/add_message_fom.dart';
import 'package:takafol/src/chat_management/application/add_message_to_donation_provider.dart';
import 'package:takafol/src/chat_management/application/record_input_provider.dart';
import 'package:takafol/src/chat_management/application/stream_message_donation.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
import 'package:takafol/src/chat_management/presentation/widgets/message_widget.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/presentaion/widgets/donation_card_widget.dart';
import 'package:takafol/src/user_management/application/get_user_as_stream.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'dart:math' show cos, sqrt, asin;

final isVoicesNow = StateProvider<bool>((ref) => false);

// ignore: must_be_immutable
class DonationMessagesPage extends ConsumerWidget {
  DonationMessagesPage({super.key, required this.donation});
  static String get routeName => "donation-massege";
  static String get routePath => "/$routeName";
  final Donation donation;

  late ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
// final text=TextEditingController();
    controller = ScrollController();
    final user = ref.read(authNotiferProvider).currentUser;
    final isNeedy = user?.accountType == AccountType.needy;
    final userId = isNeedy ? donation.needy?.id : donation.benfactor?.id;
    final form = ref.read(addMessageFormProvider);
    final voiceController = ref.read(recordVoiceMessage.notifier);

    final refresh = ValueNotifier<int>(0);
    List<Message>? messages;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ReactiveForm(
          formGroup: form,
          child: Row(
            children: [
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  elevation: 5,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            // controller:text ,

                            onChanged: (control) {
                              if (controller.hasClients) {
                                controller.animateTo(
                                    controller.position.minScrollExtent,
                                    duration: const Duration(milliseconds: 10),
                                    curve: Curves.bounceIn);
                              }
                            },
                            formControlName: "text",
                            cursorColor:
                                ref.watch(isVoicesNow) ? Colors.white : null,
                            decoration: InputDecoration(
                              hintText: ref.watch(isVoicesNow)
                                  ? "جاري تسجيل مقطع صوت أسحب للإلغاء"
                                  : "أكتب رسالة هنا..",
                              border: InputBorder.none,
                              // contentPadding: EdgeInsets.only(right: 20,top: 10)
                            ),
                          ),
                        ),
                        // const InkWell(child: Icon(Icons.image)),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ReactiveFormConsumer(builder: (context, formGroup, child) {
                final text = form.control("text").value as String?;
                final isText = text != null && text.isNotEmpty;
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                      onTapCancel: () {
                        print("---------->onTapCancel ");
                        ref.read(isVoicesNow.notifier).state = false;
                        if (!isText) {}
                      },
                      onTapUp: (de) async {
                        print(
                            "---------->onTapUp:   ${de.localPosition}  ${de.globalPosition}");
                        if (!isText) {
                          ref.read(isVoicesNow.notifier).state = false;
                          final url = await voiceController.stop();

                          form.control("voice").value = url;
                          print("-------> vv $url");
                          final dd = ref.read(addMessageToDonationProvider(
                              AddMessageToDonationProvider(
                                  donation.id ?? "", form)));

                          messages?.add(dd);
                          refresh.value++;
                          form.reset();
                          if (controller.hasClients) {
                            controller.animateTo(
                                controller.position.minScrollExtent,
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.bounceIn);
                          }
                        } else {
                          final dd = ref.read(addMessageToDonationProvider(
                              AddMessageToDonationProvider(
                                  donation.id ?? "", form)));

                          messages?.add(dd);
                          refresh.value++;
                          form.reset();
                          if (controller.hasClients) {
                            controller.animateTo(
                                controller.position.minScrollExtent,
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.bounceIn);
                          }
                        }
                      },
                      onTapDown: (TapDownDetails details) {
                        print(
                            "---------->onTapDown:   ${details.localPosition}  ${details.globalPosition}");

                        if (!isText) {
                          ref.read(isVoicesNow.notifier).state = true;
                          voiceController.record();
                        }
                      },
                      //   onTap: () {

                      //     form;
                      //     formGroup;
                      //     if(isText){
                      //    final dd=ref.read(addMessageToDonationProvider(AddMessageToDonationProvider(donation.id??"", form)));

                      //  messages?.add(dd);
                      //   refresh.value++;
                      //      form.reset();
                      //      controller.animateTo(controller.position.minScrollExtent, duration: const Duration(milliseconds: 10), curve: Curves.bounceIn);}

                      //   },
                      child: isText
                          ? const Icon(
                              Icons.send,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.mic,
                              color: Colors.white,
                            )),
                );
              })
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.dispose();
          context.go("/benefactor${BeneFactorDonationsPage.routePath}");
          form.reset();
          return false;
        },
        child: SafeArea(
          child: Column(
            children: [
              Material(
                elevation: 4,
                child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: ref.watch(streamUser(userId ?? "")).when(
                        data: (data) {
                          if (data == null) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.go(
                                        "/benefactor${BeneFactorDonationsPage.routePath}");
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/png/pic.png"),
                                ),
                                const Text("مستخدم محدوف")
                              ],
                            );
                          }
                          final dist = calculateDistance(
                              GeoPoint(
                                  latitude: user?.latitude ?? 0,
                                  longitude: user?.longitude ?? 0),
                              GeoPoint(
                                  latitude: data.latitude ?? 0,
                                  longitude: data.longitude ?? 0));
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go(
                                      "/benefactor${BeneFactorDonationsPage.routePath}");
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              data.imageUrl == null
                                  ? const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/png/pic.png"))
                                  : Container(
                                      height: 45,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: CachedNetworkImage(
                                        imageUrl: data.imageUrl ?? "",
                                      )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                isNeedy
                                    ? data.needy?.needyNumber ?? ""
                                    : data.secoundName ??
                                        "${data.firstName} ${data.lastName}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              data.isOnline
                                  ? const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: 12,
                                    )
                                  : const Icon(Icons.circle,
                                      color: Colors.grey, size: 12),
                              if (dist != 0)
                                Text(
                                  "  -  ${dist.toInt()} كم",
                                  style: const TextStyle(color: Colors.white),
                                )
                            ],
                          );
                        },
                        error: (error, stackTrace) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go(
                                      "/benefactor${BeneFactorDonationsPage.routePath}");
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/png/pic.png"),
                              )
                            ],
                          );
                        },
                        loading: () => Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.go(
                                        "/benefactor${BeneFactorDonationsPage.routePath}");
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/png/pic.png"),
                                )
                              ],
                            ))),
              ),
              SizedBox(
                height: 5.h,
              ),
              Material(
                elevation: 4,
                child: Container(
                  height: 70,
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Text("نوع التبرع:  "),
                          Text("حالة التبرع:  ")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            donation.title,
                          ),
                          getDonationStateArabicName(
                              donation.currentStatus.name),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ref.watch(streamMessageDonation(donation.id ?? "")).when(
                    data: (data) {
                      messages = data;

                      if (messages != null && messages!.isNotEmpty) {
                        return ValueListenableBuilder(
                            valueListenable: refresh,
                            builder: (context, ref, child) {
                              messages?.sort((a, b) =>
                                  b.sendDate.difference(a.sendDate).inSeconds);

                              return Expanded(
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(bottom: 60, top: 50.h),
                                  reverse: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  controller: controller,
                                  itemCount: messages?.length,
                                  itemBuilder: (context, index) {
                                    return MessageWidget(
                                        message: messages![index]);
                                  },
                                ),
                              );
                            });
                      } else {
                        return const Center(
                            child: EmptyDataComponent(
                          text: "لايوجد رسائل",
                        ));
                      }
                    },
                    error: (error, stackTrace) => const Center(
                      child: Text("غير قادر على الأتصال بالسيرفر"),
                    ),
                    loading: () => const Center(
                      child: LoadingComponent(
                        backColor: false,
                      ),
                    ),
                  ),
              Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

double calculateDistance(GeoPoint? startLocation, GeoPoint? endLocation) {
  if (startLocation?.latitude == 0 || endLocation?.latitude == 0) {
    return 0;
  }
  if (startLocation != null && endLocation != null) {
    final startLat = startLocation.latitude;
    final startLon = startLocation.longitude;
    final endLat = endLocation.latitude;
    final endLon = endLocation.longitude;

    const p = 0.017453292519943295;
    const c = cos;
    final a = 0.5 -
        c((endLat - startLat) * p) / 2 +
        c(startLat * p) * c(endLat * p) * (1 - c((endLon - startLon) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
  return 0;
}
