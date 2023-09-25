import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/phone_picker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';
import 'package:takafol/src/sigin_management/presentation/widgets/otp_widget.dart';
import 'package:takafol/src/user_management/application/app_user_form.dart';

class VerificationComponent extends ConsumerWidget {
  const VerificationComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //otp.json
          LottieBuilder.asset(
            "assets/json/otp.json",
            width: 1000.w,
            height: 1100.h,
            fit: BoxFit.cover,
          ),

          Text(
            "تاكيد رمز التحقق",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 200.h,
          ),
          const OTPWidget(),
          SizedBox(
            height: 80.h,
          ),
          ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              final otp=formGroup.control("sginUp.verification.verificationCode").value as String?;
              final isValed=(otp!=null&&otp.length==6);
              return MainButton(

                text: "تاكيد رمز التحقق",
                onPressed:isValed? () {

                  ref.read(authNotiferProvider.notifier).checkOtp(otp!);
                }:null,
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      );
    
  }
}
