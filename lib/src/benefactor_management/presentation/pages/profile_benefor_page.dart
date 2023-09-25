import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/benefactor_management/application/update_profile_form.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/widgets/date_picker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/profile_image_picker.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';
import 'package:location/location.dart';

class ProfileBeneforPage extends ConsumerWidget {
  const ProfileBeneforPage({super.key});
  static String get  routeName=>"ben-profile";
  static String get  routePath=>"/$routeName";
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final user= ref.read(authNotiferProvider).currentUser;
   final form=updateProfileForm(user!);
    return ReactiveForm(
      formGroup: form,
      child: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      const PhotoUserCompenent(
                          photoControl: "userImformation.image", photoUrlControl: "userImformation.imageUrl"),
                      Container(
                        margin: EdgeInsets.only(top: 40.h),
                        padding: EdgeInsets.all(40.sp),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("المعلومات الشخصية"),
                            TextBoxFieldWidget(
                                controlName: "userImformation.name",
                                label: "الاسم",
                                validationMessages: {
                                  ValidationMessage.required: (p0) => "حقل مطلوب",
                                }),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextBoxFieldWidget(
                                controlName: "userImformation.surname",
                                label: "الكنية",
                                validationMessages: {
                                  ValidationMessage.required: (p0) => "حقل مطلوب",
                                }),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextBoxFieldWidget(
                                controlName: "userImformation.secoundName", label: "اللقب"),
                            SizedBox(
                              height: 30.h,
                            ),
                            const Text("مواليد"),
                            const ReactiveDatePickerWidget(
                              dateControl: "userImformation.birthDay",
                              label: "مواليد",
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        margin: EdgeInsets.only(top: 40.h),
                        padding: EdgeInsets.all(40.sp),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            return Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    BotToast.showCustomLoading(
                                      toastBuilder: (cancelFunc) {
                                        return const LoadingComponent();
                                      },
                                    );
                                    final location = await _handleLocation();
                                    BotToast.closeAllLoading();
                                    if (location == null) {
                                      BotToast.showText(text: "فشل تحديد الموقع");
                                    } else {
                                      formGroup.control("userImformation.location").value = location;
                                    }
                                  },
                                  icon: const Icon(Icons.my_location),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(formGroup.control("userImformation.location").value == null
                                    ? "لم يتم تحديد الموقع"
                                    : "تم تحديد الموقع")
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.h),
                        padding: EdgeInsets.all(40.sp),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("معلومات الحساب"),
                            TextBoxFieldWidget(
                              controlName: "userImformation.username",
                              label: "اسم المستخدم",
                              validationMessages: {
                                ValidationMessage.required: (p0) => "حقل مطلوب",
                                ValidationMessage.minLength: (p0) =>
                                    "اسم المستخدم من ستة حقول على الأقل"
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            // ReactiveFormConsumer(
                            //   builder:(context, formGroup, child)  {
                            //     return TextBoxFieldWidget(
                            //       showPassword: () {
                            //         formGroup.control("userImformation.isHidden").value =
                            //             !formGroup.control("userImformation.isHidden").value;
                            //       },
                            //       isSecure: formGroup.control("userImformation.isHidden").value,
                            //       controlName: "userImformation.password",
                            //       label: "كلمة المرور",
                            //       validationMessages: {
                            //         ValidationMessage.required: (p0) =>
                            //             "كلمة المرور إجبارية",
                            //         ValidationMessage.minLength: (p0) =>
                            //             "كلمة المرور من ثمانية حقول على الأقل"
                            //       },
                            //     );
                            //   }
                            // ),
                            // SizedBox(
                            //   height: 30.h,
                            // ),
                            // ReactiveFormConsumer(
                            //   builder:(context, formGroup, child)  {
                            //     return TextBoxFieldWidget(
                            //         showPassword: () {
                            //           formGroup.control("userImformation.isHidden").value =
                            //               !formGroup.control("userImformation.isHidden").value;
                            //         },
                            //         isSecure: formGroup.control("userImformation.isHidden").value,
                            //         controlName: "userImformation.passwordConfirm",
                            //         label: "تاكيد كلمة المرور",
                            //         validationMessages: {
                            //           ValidationMessage.required: (p0) =>
                            //               "كلمة المرور إجبارية",
                            //           ValidationMessage.mustMatch: (p0) =>
                            //               "كلمة المرور متطابقة"
                            //         });
                            //   }
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      ReactiveFormConsumer(builder: (context, formGroup, child) {
                        return MainButton(
                          text: "تحديث",
                          onPressed: form.valid
                              ? () {
                                  print("--->${form.status}");
                                  ref
                                      .read(authNotiferProvider.notifier)
                                      .updateUser(form);
                                }
                              : null,
                        );
                      }),SizedBox(height: 100.h,),
          
                      MainButton(
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
                      SizedBox(
                        height: 300.h,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
        
      
  }

  Future<GeoPoint?> _handleLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      _locationData = await location.getLocation();
      if (_locationData.latitude == null || _locationData.longitude == null) {
        return null;
      }
      return GeoPoint(
          latitude: _locationData.latitude!,
          longitude: _locationData.longitude!);
    } catch (e) {
      print("--->location Error: ${e.toString()}");
      return null;
    }
  }
}