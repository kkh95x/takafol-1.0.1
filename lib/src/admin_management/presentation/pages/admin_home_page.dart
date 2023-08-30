import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
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
                    data: (data) {
                      if (data == null || data.isEmpty) {
                        return const EmptyDataComponent(

                          text: "لم تقم باضافة محتاجين بعد",
                        );
                      }
                      
      
                      print("----> ${data.length}");
      
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(authNotiferProvider.notifier).logout();
                    },
                    child: const Text("تسجيل الخروج")),
                     ElevatedButton(
                onPressed: () {
                  ref.read(getNeedyStream.notifier).init();
                },
                child: const Text("تحديث الخريطة")),
              ],
            ),
                
           
          ],
        ),
      ),
    );
  }
}
