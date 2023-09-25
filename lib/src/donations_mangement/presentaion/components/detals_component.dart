import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/chat_management/presentation/pages/donation_messages_page.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/static_voice_component.dart';
import 'package:takafol/src/donations_mangement/application/donation_reall_time_provider.dart';
import 'package:takafol/src/donations_mangement/application/reject_donation_provider.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/notification/application/notification_service.dart';
import 'package:takafol/src/notification/domain/notification.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';
import '../widgets/donation_card_widget.dart';

class DetalisComponent extends ConsumerWidget {
  final Donation donation;

  const DetalisComponent({super.key, required this.donation});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    


    return SafeArea(
      child: SingleChildScrollView(
        physics:const AlwaysScrollableScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.all(50.sp),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 50.w,
                      ),
                      padding: EdgeInsets.only(
                          top: 150.sp,
                          right: 50.sp,
                          left: 50.sp,
                          bottom: 50.sp),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "نوع التبرع: ",
                              ),
                              Expanded(
                                child: Text(
                                  donation.title,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "مزيد من التفاصيل : ",
                              ),
                              Text(
                                donation.body ?? "-",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "المتبرع: ",
                              ),
                              Text(
                                donation.benfactor?.name ?? "-",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "المستفيد: ",
                              ),
                              Text(
                                donation.needy?.name ?? "-",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "الحالة: ",
                              ),
                              getDonationStateArabicName(
                                  donation.currentStatus.name)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 20.h,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.w, vertical: 20.h),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: const Text(
                            "تفاصيل",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
                if (donation.notes?.imageUrl != null)
                  SizedBox(
                    height: 50.h,
                  ),
                if (donation.notes?.imageUrl != null)
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: 50.w,
                          ),
                          padding: EdgeInsets.only(
                              top: 150.sp,
                              right: 50.sp,
                              left: 50.sp,
                              bottom: 50.sp),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    crossAxisCount: 3),
                            itemCount: donation.notes!.imageUrl!.length,
                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: donation.notes!.imageUrl![index]);
                            },
                          )),
                      Positioned(
                          top: 20.h,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: const Text(
                              "الصور",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                if (donation.notes?.voiceUrl != null)
                  SizedBox(
                    height: 50.h,
                  ),
                if (donation.notes?.voiceUrl != null)
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 50.w,
                        ),
                        padding: EdgeInsets.only(
                            top: 150.sp,
                            right: 50.sp,
                            left: 50.sp,
                            bottom: 50.sp),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: StaticVoiceComponent(
                          // color: Colors.blue,
                          urlVoice: donation.notes?.voiceUrl!.first,
                        ),
                      ),
                      Positioned(
                          top: 20.h,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: const Text(
                              "الصوتيات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                    getControll( ref,context),
               
              ],
            )),
      ),
    );
  }


  Widget getControll(WidgetRef ref,BuildContext context){
     final user=ref.read(authNotiferProvider).currentUser;
    final isNeedy=user?.accountType==AccountType.needy;
    // final isWaiting=[DonationState.acypt,DonationState.send].contains(donation.currentStatus.name);
    final isSend=DonationState.send==donation.currentStatus.name;
        final isAcypt=DonationState.acypt==donation.currentStatus.name;
    if(isNeedy){
    if(isAcypt){
      return   Container(
                  padding: EdgeInsets.all(50.sp),
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(40.sp),
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Column(
                                      children: [Text("استلام الحالة"), Divider()],
                                    ),
                                    content:
                                        const Text("هل أنت متأكد من انك استلمت الحالة؟"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await ref.read(changeDonationProvider(
                                                    ChangeDonationProviderInput(
                                                        context: context,
                                                        newState: DonationState.recived,
                                                        donation: donation))
                                                .future);
                                          },
                                          child: const Text("نعم")),
                                      ElevatedButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Text("لا"))
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Row(
                              children: [Text("انهاء الحالة"), Icon(Icons.close)],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(40.sp),
                                                    margin: EdgeInsets.symmetric(horizontal: 10.w),

                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () {
                  // Navigator.of(context).pushNamed(DonationMessagesPage.routePath,arguments:donation )
                               context.go(DonationMessagesPage.routePath,extra: donation);
                            },
                            child: const Row(
                              children: [
                                Text("مراسلة"),
                                Icon(Icons.message_outlined)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
    }else if(isSend){
      return  Container(
                  padding: EdgeInsets.all(50.sp),
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 10.w),

                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Column(
                                      children: [Text("رفض الحالة"), Divider()],
                                    ),
                                    content:
                                        const Text("هل أنت متأكد من رفض الحالة؟"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await ref.read(changeDonationProvider(
                                                    ChangeDonationProviderInput(
                                                        context: context,
                                                        newState: DonationState.rejectFromNeed,
                                                        donation: donation))
                                                .future);

                                            ref.read(notificationServiceProvider).createNotification(AppNotification(title: "تم رفض التبرع", body:"قام أحد الستفيدين برفض تبرعك يرجى مراجعة التبرعات لمزيد من التفاصيل", from: UserInformation(
id: user?.id,
accountType: user?.accountType,
birthDay: user?.birthday,
imageUrl: user?.imageUrl,
name: user?.secoundName
), refreanceId: donation.benfactor?.id??"", type: NotificationType.donation, extra: ""));
                                          },
                                          child: const Text("نعم")),
                                      ElevatedButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Text("لا"))
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Row(
                              children: [Text("رفض الحالة"), Icon(Icons.close)],
                            ),
                          ),
                        ),
                        Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 10.w),

                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Column(
                                      children: [Text("قبول الحالة"), Divider()],
                                    ),
                                    content:
                                        const Text("هل أنت متأكد من قبول الحالة؟"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await ref.read(changeDonationProvider(
                                                    ChangeDonationProviderInput(
                                                        context: context,
                                                        newState: DonationState.acypt,
                                                        donation: donation))
                                                .future);
                                                 ref.read(notificationServiceProvider).createNotification(AppNotification(title: "${donation.title} تم قبول التبرع", body:"قام أحد الستفيدين بقبول تبرعك يرجى مراجعة التبرعات لمزيد من التفاصيل", from: UserInformation(
id: user?.id,
accountType: user?.accountType,
birthDay: user?.birthday,
imageUrl: user?.imageUrl,
name: user?.secoundName
), refreanceId: donation.needy?.id??"", type: NotificationType.donation, extra: ""));
                                          },
                                          child: const Text("نعم")),
                                      ElevatedButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Text("لا"))
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Row(
                              children: [Text("قبول الحالة"), Icon(Icons.close)],
                            ),
                          ),
                        ),
                        
                        Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 10.w),

                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () {
                  // Navigator.of(context).pushNamed(DonationMessagesPage.routePath,arguments:donation )
                               context.go(DonationMessagesPage.routePath,extra: donation);
                            },
                            child: const Row(
                              children: [
                                Text("مراسلة"),
                                Icon(Icons.message_outlined)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
   
    }else{
      return const SizedBox();
    }
    }else{
      if(isSend){
        return Container(
                  padding: EdgeInsets.all(50.sp),
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          
                           Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 10.w),

                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Column(
                                      children: [Text("الغاء الحالة"), Divider()],
                                    ),
                                    content:
                                        const Text("هل أنت متأكد من الغاء الحالة؟"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await ref.read(changeDonationProvider(
                                                    ChangeDonationProviderInput(
                                                        context: context,
                                                        newState: DonationState.rejectFromBenfactor,
                                                        donation: donation))
                                                .future);
                                          },
                                          child: const Text("نعم")),
                                      ElevatedButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Text("لا"))
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Row(
                              children: [Text("الغاء الحالة"), Icon(Icons.close)],
                            ),
                          ),
                  
                        )]),
                  ));
                      
      }else{
        return Container( padding: EdgeInsets.all(50.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                               
                                Container(
                                                            margin: EdgeInsets.symmetric(horizontal: 10.w),

                          padding: EdgeInsets.all(40.sp),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: InkWell(
                            onTap: () {
                  // Navigator.of(context).pushNamed(DonationMessagesPage.routePath,arguments:donation )
                               context.go(DonationMessagesPage.routePath,extra: donation);
                            },
                            child: const Row(
                              children: [
                                Text("مراسلة"),
                                Icon(Icons.message_outlined)
                              ],
                            ),
                          ),
                        )
                              ],
                            ),
                  ),
        );
                      
      }
    }

  }
}
