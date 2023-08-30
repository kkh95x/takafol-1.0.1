import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/donations_mangement/domain/donation_status.dart';
import 'package:shimmer/shimmer.dart';
class DonationCardWidget extends StatelessWidget {
  const DonationCardWidget(
      {super.key,
      required this.createdDate,
      required this.images,
      required this.inf,
      required this.title,
      required this.donationState,
      this.onTap,
      this.popupMenu,
      required this.to});
//  final  String from;
  final String? to;
  final String title;
  final String? inf;
  final List<String>? images;
  final DateTime? createdDate;
  final DonationState donationState;
    final List<PopupMenuEntry<dynamic>>? popupMenu;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      padding: EdgeInsets.only(top: 20.h, right: 20.w, bottom: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.fill,
              image: Image.asset("assets/png/donation_card.png").image)),
      child: InkWell(
        onTap:onTap ,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width ,
                    child: Text(
                    
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 64.sp, color: Colors.blue),
                    ),
                  ),
                  if (inf != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "تفاصيل : ",
                         
                        ),
                        Expanded(
                          child: Text(inf!,overflow: TextOverflow.ellipsis, style:const TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  if (createdDate != null)
                    Row(
                      children: [
                        const Text(
                          "وقت الإنشاء: ",
                         
                        ),
                        Text(DateFormat("yyyy-mm-dd hh:mm").format(createdDate!), style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  Row(
                    children: [const Text("حالة التبرع: "), getDonationStateArabicName(donationState)],
                  ),
                  if (images != null && images!.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        for (var x in images!) _buildImage(x),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                ],
              ),
            if(popupMenu!=null&&popupMenu!.isNotEmpty)
            
            Positioned(
              top: 20.h,
              left: 20.w,
              child: PopupMenuButton(
              
                                elevation: 2,
                                position: PopupMenuPosition.under,
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                iconSize: 90.h,
                                color: Theme.of(context).colorScheme.shadow,
                                
                                 itemBuilder: (context) => popupMenu!,))
            
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(String url) {
    print("---->img ${url}");
    return Container(
      height: 150.sp,
      width: 140.sp,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: url,
        // imageBuilder: (context, imageProvider) => Image(image: imageProvider),
        placeholder: (context, url) =>  Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
    )
  ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

 
}
 Widget getDonationStateArabicName(DonationState donationStatus) {
    switch (donationStatus) {
      case DonationState.created:
        return const Text(
          "منشئ وغير مسند",
          style:  TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
        );
      case DonationState.send:
        return const Text(
          "قيد الإرسال",
          style:  TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
        );
      case DonationState.acypt:
        return const Text(
          "تم القبول",
          style:  TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
        );
      case DonationState.recived:
        return const Text(
          "مستلم",
          style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)
        );
      case DonationState.complete:
        return const Text(
          "مكتمل",
          style:  TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
        );
      case DonationState.rejectFromNeed:
        return const Text(
          "تم رفضه من المستفيد",
          style:  TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
        );
      case DonationState.rejectFromBenfactor:
        return const Text(
          "تم رفضه من المتبرع",
          style:  TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
        );
    }
  }