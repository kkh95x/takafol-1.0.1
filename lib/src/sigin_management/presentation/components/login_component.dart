import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/auth/auth_state.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';

class LoginComponent extends ConsumerWidget {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveFormConsumer(builder: (context, formGroup, child) {
      return ReactiveForm(
        formGroup: formGroup.control("login") as FormGroup,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/json/login.json",
              width: 1000.w,
              height: 800.h,
              fit: BoxFit.cover,
            ),
            Text(
              "تسجيل الدخول",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 100.h,
            ),
            TextBoxFieldWidget(
              controlName: "username",
              label: "أسم المستخدم",
              validationMessages: {
                ValidationMessage.required: (p0) => "أسم المستخدم مطلوب"
              },
            ),
            SizedBox(
              height: 80.h,
            ),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                return TextBoxFieldWidget(
                  showPassword: () {
                    formGroup.control("isHidden").value =
                        !formGroup.control("isHidden").value;
                  },
                  isSecure: formGroup.control("isHidden").value,
                  controlName: "password",
                  label: "كلمة المرور",
                  validationMessages: {
                    ValidationMessage.required: (p0) => "كلمة المرور إجبارية",
                    ValidationMessage.minLength: (p0) =>
                        "كلمة المرور من ثمانية حقول على الأقل"
                  },
                );
              },
            ),
            SizedBox(
              height: 100.h,
            ),
            ReactiveFormConsumer(
              builder: (context, formGroup2, child) {
                return MainButton(
                  text: "تسجيل الدخول",
                  onPressed: formGroup.valid
                      ? () {
                          ref
                              .read(authNotiferProvider.notifier)
                              .login(formGroup);
                        }
                      : null,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text("أو قم بإنشاء حساب جديد"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(authNotiferProvider.notifier)
                            .changeState(AuthStatus.signup);
                      },
                      icon: Icon(
                        Icons.phone,
                        size: 80.sp,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(authNotiferProvider.notifier)
                            .changeState(AuthStatus.signup);
                      },
                      icon: Icon(
                        Icons.email,
                        size: 80.sp,
                        color: Colors.white,
                      )),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
