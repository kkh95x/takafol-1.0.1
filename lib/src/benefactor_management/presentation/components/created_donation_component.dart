import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takafol/src/benefactor_management/application/dontions_providers.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/application/donation_reall_time_provider.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/presentaion/widgets/donation_card_widget.dart';

class DonationCreatedComponent extends ConsumerWidget {
  const DonationCreatedComponent({super.key,required this.data});
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
                      onPressed: ()async {
                    ref.refresh(streamMyDonations);
                      },
                      icon: const Icon(Icons.refresh)),
           
          ],
              ),
            ),
                 Expanded(
              child: ListView.builder(
                    
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index ) {
                  return _buildCard(data, index,context);
                },
              ),
            ),
            
            ]);
    
    
    
    
    
    
    
    
    // ref.watch(createdDontionProvider).when(
    //   data: (data) {
    //     if (data == null || data.isEmpty) {
    //       return const EmptyDataComponent(text: "لا يوجد تبرعات");
    //     }
    //     return Column(
    //       children: [
    //         Container(
    //           padding: EdgeInsets.symmetric(horizontal: 100.w),
    //           height: 100.h,
    //           child: Row(
    //             children: [
    //               Text("التبرعات (${data.length})"),
    //               const Spacer(),
    //               IconButton(
    //                   onPressed: ()async {
    //                    await ref.read(createdDontionProvider.notifier).init();
    //                   },
    //                   icon: const Icon(Icons.refresh))
    //             ],
    //           ),
    //         ),


    //         Expanded(
    //           child: ListView.builder(
                    
    //             physics: const BouncingScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount: data.length,
    //             itemBuilder: (context, index ) {
    //               return _buildCard(data, index,context);
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


  DonationCardWidget _buildCard(List<Donation> data, int index,BuildContext context) {
    return DonationCardWidget(
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
                donationState: data[index].currentStatus.name,
                createdDate: data[index].createdDate,
                images: data[index].notes?.imageUrl,
                inf: data[index].body,
                title: data[index].title,
                to: data[index].needy?.name);
  }
}
