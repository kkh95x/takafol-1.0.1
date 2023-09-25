import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';

class AdminNeedyHomePage extends ConsumerWidget {
  const AdminNeedyHomePage({super.key});
  static String get routeName => "admin-needy";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 182.h),
          child: const FloatingAdminButtonComponent()),
      body: ref.watch(getNeedyStream).when(data: (data) {
        if( data !=null && data.isNotEmpty){

       return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
         return Card(
           child: Container(
             padding: EdgeInsets.all(10.sp),
             height: 250.h,
             child: ListTile(
              leading: IconButton(onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: const Text("حذف المستفيد"),
                    content: Text("هل تريد حذف المستفيد ذو المعرف ${data[index].needy?.needyNumber} ؟"),
                    actions: [
                      ElevatedButton(onPressed: ()async {
                        BotToast.showLoading();
                        await  ref.read(appUserRepositoryProvider).delete(data[index]);
                        BotToast.closeAllLoading();
                        ref.read(getNeedyStream.notifier).init();
                        context.pop();
                      }, child: const Text("نعم")),
                       ElevatedButton(onPressed: () {
                                                context.pop();

                      }, child: const Text("لا"))
                    ],
                  );
                },);
              }, icon: const Icon(Icons.delete)),
              title: Text("م.مستفيد: ${data[index].needy?.needyNumber}"),
                        // subtitle: Text(" أسم الزوج : ${data[index]. } ${data[index].needy?.zLName }"),
                trailing: SizedBox(
                  
                  child: Column(
                    children: [
                      
                      Text("u: ${data[index].username}"),
                      Text("p: ${data[index].password}"),
                    ],
                  ),
                ),
           
             ),
           ),
         );
       },);
        }
        return const Center(child: Text("لا يوجد محتاجين"),);
      }, error: (error, stackTrace) => const Center(child: Text("خطأ"),), loading: () => const Center(child: LoadingComponent(backColor: false,),),)
          
        
      
    );
  }
}
