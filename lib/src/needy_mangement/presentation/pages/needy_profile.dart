import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/tap_bar_component.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';

class NeedyProfile extends ConsumerWidget {
  const NeedyProfile({super.key});
  static String get  routeName=>"needy-profile";
  static String get routePath=>"/$routeName";

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final user=ref.read(authNotiferProvider).currentUser;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactiveForm(
              formGroup: FormGroup({}),
              child: const TapBarComponent(
                        title: "البروفايل",
                        showTap: false,
                        
                       ),
            ),
           Container(
            height: 250.h,
            margin: EdgeInsets.symmetric(horizontal: 150.w),
            child: Card(
              child: ListTile(
                title: Text("أسم المستخدم: ${user?.username}"),
              ),
            ),
           ),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 150.w),
            height: 250.h,
      
            child: Card(
              child: ListTile(
                title: Text("المعرف الخاص بك: ${user?.needy?.needyNumber}"),
              ),
            ),
      
           ),
           SizedBox(height: 50.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100.h),
              child: MainButton(
                              text:"تسجيل الخروج",
                              color: Colors.red.shade300,
              
                              onPressed: 
                                   () {
                                      ref
                                          .read(authNotiferProvider.notifier)
                                          .logout();
                                    }
                         ,
                            ),
            ),
                        SizedBox(
                          height: 300.h,
                        ),
          ],
        ),
      ),
    );
  }
}