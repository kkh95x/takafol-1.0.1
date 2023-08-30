import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, this.onPressed});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      backgroundColor: onPressed == null ? Colors.grey : Colors.blue.shade500,
      height: 150.h,
      text: text,
      borderRadius: 80.r,
      fontSize: 50.sp,
      buttonType: SocialLoginButtonType.generalLogin,
      // imageWidth: 20,
      onPressed: onPressed,
    );
  }
}
