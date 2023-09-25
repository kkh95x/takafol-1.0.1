
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/components/tap_bar_component.dart';
import 'package:takafol/src/notification/application/get_my_notification_provider.dart';
import 'package:intl/intl.dart';
import 'package:takafol/src/notification/application/notification_service.dart';
import 'package:takafol/src/notification/domain/notification.dart';
class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});
static String get routeName=>"notification-page";
static String get routePath=>"/$routeName";
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controll=ScrollController();
    controll.addListener(() {
      if(controll.position.pixels==controll.position.maxScrollExtent) {
        ref.read(countIndexProvider.notifier).state++;
      }
     });
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            ReactiveForm(
              formGroup: FormGroup({}),
              child: const TapBarComponent(title: "الإشعارات",showTap: false)),
            RefreshIndicator(
               onRefresh: ()async {
            ref.watch(getMyNotificationProvider.notifier).init();
            return ;
          },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ref.watch(getMyNotificationProvider).when(
                      skipError: true,
                      skipLoadingOnRefresh: true,
                      skipLoadingOnReload: true,
                        
                      data: (data) {
                        if(data.isEmpty){
                          return const Align(
                            alignment: Alignment.center,
                            child:  EmptyDataComponent(text: "لا توجد إشعارات"),);
                        }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                        
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                          
                            child: Card(
                              color:data[index].state==NotificationState.seen?Colors.white24:Colors.white  ,
                              child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              padding: EdgeInsets.all(10.sp),
                              child: ListTile(
                                title: Text(data[index].title),
                                trailing: Text(DateFormat("yyyy-mm-dd hh:mm").format(data[index].created_at!)),
                                subtitle: Text(data[index].body),
                                onTap: () {
                                  ref.read(notificationServiceProvider).setNotificationAsSeen(data[index]).then((value) {
                                  ref.watch(getMyNotificationProvider.notifier).init();
      
                                  });
                                },
                              ),
                            ),
                            ),
                          );
                        
                      },);
                    }, error: (error, stackTrace) => Center(child: Text("Erorr:${error.toString()}"),), loading: () {
                      return const Align(
                            alignment: Alignment.center,  child: const LoadingComponent(backColor: false,),);
                    },),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}