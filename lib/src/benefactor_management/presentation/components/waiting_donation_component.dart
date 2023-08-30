import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/benefactor_management/application/dontions_providers.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/application/donation_providers.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/presentaion/pages/donation_detals_page.dart';
import 'package:takafol/src/donations_mangement/presentaion/widgets/donation_card_widget.dart';

class BenefctorDonationWitingComponent extends ConsumerWidget {
  const BenefctorDonationWitingComponent({super.key ,required this.data});
   final List<Donation> data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              height: 100.h,
              child: Row(
                children: [
                  Text("التبرعات (${data.length})"),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        await ref.read(waitingDontionProvider.notifier).init();
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return _buildCard(data[index], context,ref);
                },
              ),
            ),
          ],
        );
    
    // ref.watch(waitingDontionProvider).when(
    //   data: (data) {
    //     if (data == null || data.isEmpty) {
    //       return const EmptyDataComponent(text: "لا يوجد تبرعات");
    //     }
    //     return 
    //     Column(
    //       children: [
    //         Container(
    //           padding: EdgeInsets.symmetric(horizontal: 100.w),
    //           height: 100.h,
    //           child: Row(
    //             children: [
    //               Text("التبرعات (${data.length})"),
    //               const Spacer(),
    //               IconButton(
    //                   onPressed: () async {
    //                     await ref.read(waitingDontionProvider.notifier).init();
    //                   },
    //                   icon: const Icon(Icons.refresh))
    //             ],
    //           ),
    //         ),
    //         const Divider(),
    //         Expanded(
    //           child: ListView.builder(
    //             physics: const BouncingScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount: data.length,
    //             itemBuilder: (context, index) {
    //               return _buildCard(data[index], context);
    //             },
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    //   error: (error, stackTrace) {
    //     return Text(error.toString());
    //   },
    //   loading: () {
    //     return const LoadingComponent(
    //       backColor: false,
    //     );
    //   },
    // );
  }

  DonationCardWidget _buildCard(Donation data, BuildContext context,WidgetRef ref) {
    return DonationCardWidget(
        onTap: () {
                          ref.read(currentDoationForDetails.notifier).state=data.id?? "";

          context.push(DonationDetalsPage.routPath, extra: data.id);
        },
        //     popupMenu: [
        //        PopupMenuItem(
        //   onTap: () async {

        //   },
        //   value: '',
        //   child:const Row(
        //     children: [
        //        Icon(Icons.person_add,color: Colors.white,),
        //        SizedBox(width: 5),
        //       Text('تحديد مستفيد',style: TextStyle(color: Colors.white),),
        //     ],
        //   ),
        // ),

        //     ],
        donationState: data.currentStatus.name,
        createdDate: data.createdDate,
        images: data.notes?.imageUrl,
        inf: data.body,
        title: data.title,
        to: data.needy?.name);
  }
}
