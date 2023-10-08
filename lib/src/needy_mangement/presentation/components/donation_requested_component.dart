
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/donations_mangement/application/donation_providers.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/presentaion/pages/donation_detals_page.dart';
import 'package:takafol/src/donations_mangement/presentaion/widgets/donation_card_widget.dart';
import 'package:takafol/src/needy_mangement/application/donation_real_time_provider.dart';

class RequestedDonationComponent extends ConsumerWidget {
  const RequestedDonationComponent({super.key,required this.donation});
 final  List<Donation>? donation;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              height: 100.h,
              child: Row(
                children: [
                  Text("التبرعات (${donation?.length??0})"),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                         ref.read(streamMyDonationsNeedy.notifier).init();
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child:    !(donation!=null&&donation!.isNotEmpty)?
                           const Center(child: Text("لاتوجد تبرعات"),)
                        :
              
              
              ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: donation!.length,
                itemBuilder: (context, index) {
                  return _buildCard(donation![index], context,ref);
                },
              ),
            ),
          ],
        );
  }
  DonationCardWidget _buildCard(Donation data, BuildContext context,WidgetRef ref) {
    return DonationCardWidget(
        onTap: () {
                          ref.read(currentDoationForDetails.notifier).state=data.id?? "";

          context.push("/needy${DonationDetalsPage.routePath}", extra: data.id);
        },
        
            popupMenu: [
               PopupMenuItem(
          onTap: () async {

          },
          value: '',
          child:const Row(
            children: [
               Icon(Icons.person_add,color: Colors.white,),
               SizedBox(width: 5),
              Text('قبول',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
         PopupMenuItem(
          onTap: () async {

          },
          value: '',
          child:const Row(
            children: [
               Icon(Icons.person_add,color: Colors.white,),
               SizedBox(width: 5),
              Text('رفض',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),


            ],
        donationState: data.currentStatus.name,
        createdDate: data.createdDate,
        images: data.notes?.imageUrl,
        inf: data.body,
        title: data.title,
        to: data.needy?.name);
  }
  
}