import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/phone_picker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';

class SiginUpComponent extends ConsumerWidget {
  const SiginUpComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // sginup.json
            LottieBuilder.asset(
              "assets/json/sginup.json",
              width: 1000.w,
              height: 800.h,
              fit: BoxFit.cover,
            ),

            Text(
              "إنشاء حساب",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 100.h,
            ),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                final isPhone = formGroup.control("sginUp.isPhone").value as bool;
                return Column(
                  children: [
                    Container(
                       height: 200.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(50.r)),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              // formGroup.control("isPhone").value = true;
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title:const Column(
                                          children:  [
                                            Text(
                                              "تنويه",
                                            ),
                                            Divider()
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () => context.pop(),
                                              child: const Text("رجوع"))
                                        ],
                                        content: const Text("غير مدعوم حالياَ"),
                                      ));
                            },
                            child: Container(
                              height: 200.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: isPhone ? Colors.blue :null,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Text(
                                "رقم الجوال",
                                style: TextStyle(
                                    color: isPhone ? Colors.white : Colors.black),
                              ),
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              formGroup.control("sginUp.isPhone").value = false;
                            },
                            child: Container(
                              height: 200.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: !isPhone ? Colors.blue : null,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Text(
                                "البريد الإلكتروني",
                                style: TextStyle(
                                    color:
                                        !isPhone ? Colors.white : Colors.black),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    AnimatedCrossFade(
                        firstChild:
                            const PhonePickerWidget(formControlName: "sginUp.phone"),
                        secondChild: TextBoxFieldWidget(
                          controlName: "sginUp.email",
                          label: "اللبريد الإلكتروني",
                          validationMessages: {
                            ValidationMessage.required: (p0) => "الإيميل مطلوب",
                            ValidationMessage.email: (p0) =>
                                "صيغة الإيميل خاطئة",
                          },
                        ),
                        crossFadeState: isPhone
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 200))
                  ],
                );
              },
            ),

            SizedBox(
              height: 100.h,
            ),
            ReactiveFormConsumer(
            
              builder: (context, formGroup, child) {
                // final isPhone = formGroup.control("sginUp.isPhone").value;
                // final isPhoneValid = formGroup.control("sginUp.phone").valid;
                final isEmailValid = formGroup.control("sginUp.email").valid;
                // final form =formGroup.control("sginUp") as FormGroup;
                
                // print("------> $isPhone $isPhoneValid $isEmailValid ${form.valid}");
                return MainButton(
                  text: "طلب رمز التحقق",
                  onPressed:isEmailValid
                          ? () => call(formGroup, false, ref)
                          : null,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        )
      ;
  }

  call(FormGroup formGroup, bool isPhone, WidgetRef ref) {
    
    ref.read(authNotiferProvider.notifier).sendOtp(formGroup);
  }
}
