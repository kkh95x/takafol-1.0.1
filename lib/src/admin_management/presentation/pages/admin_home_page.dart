import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:takafol/src/admin_management/application/get_needy_provider.dart';
import 'package:takafol/src/admin_management/presentation/components/floating_admin_button.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/components/map_component.dart';

class AdminHomePage extends ConsumerWidget {
  const AdminHomePage({super.key});
  static String get routeName => "admin-home";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 182.h),
          child: const FloatingAdminButtonComponent()),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: 
              
              ref.watch(getNeedyStream).when(
                   skipLoadingOnRefresh: true,
                    data: (data) {
                      if (data == null || data.isEmpty) {
                        return const EmptyDataComponent(

                          text: "لم تقم باضافة محتاجين بعد",
                        );
                      }
                      
      
                      
      
                      return MapComponent(
                          // point:GeoPoint(latitude: data.first.latitude??0, longitude: data.first.longitude??0)
                          onGeoPointClicked: (p0) {},
                          initZoom: 12,
                          pepole: data);
                    },
                    error: (error, stackTrace) => Center(child: Text(error.toString())),
                    loading: () =>const Center(
                      child:  LoadingComponent(
                        backColor: false,
                      ),
                    ),
                  ),
            ),
            // Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         ElevatedButton(
            //             onPressed: () {
            //               ref.read(authNotiferProvider.notifier).logout();
            //             },
            //             child: const Text("تسجيل الخروج")),
            //              ElevatedButton(
            //         onPressed: () {
            //         },
            //         child: const Text("تحديث الخريطة")),
                    
            //       ],
            //     ),
                // Container(
         
                //   margin: EdgeInsets.all(10.sp),
                //   decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(20.r)),
                //   padding: EdgeInsets.all(20.sp),
                //   child: const MarqueeText(
                //     speed: 8,
                //     marqueeDirection: MarqueeDirection.ltr,
                //     text: TextSpan(text: " اخر الأخبار - عدد المحتاجين  المتبرعين النشط الآن واحصائيات التبرعات المسلمة اليوم عند النقر تفتح صفحة الاحصائيات ",)),
                // ),
          //     ],
          //   ),
                
           
          ],
        ),
      ),
    );
  }
}
