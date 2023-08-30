import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/auth/auth_state.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';
import 'package:takafol/src/user_management/application/app_user_form.dart';

class WaitingEmailComponent extends ConsumerWidget {
  const WaitingEmailComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveFormConsumer(

      builder: (context, formGroup, child) {
        return ReactiveForm(
          formGroup: formGroup.control("login") as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                            SizedBox(height: 300.h,),

              LottieBuilder.asset("assets/json/email.json",width: 1000.w,height: 800.h,fit: BoxFit.cover,),
              SizedBox(height: 300.h,),
              Text("سيتم إرسال رابط التحقق عبر البريد الإلكتروني يرجى التحقق من البريد الوارد",style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)
             
              
              
            ],
          ),
        );
      }
    );
  }
}
