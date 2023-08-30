import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/admin_management/application/add_needy_provider.dart';
import 'package:takafol/src/admin_management/application/needy_form.dart';
import 'package:takafol/src/core/presentation/components/map_needy_input_component.dart';
import 'package:takafol/src/core/presentation/widgets/date_picker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';

final scrollMap = StateProvider<bool>((ref) => false);

class AddNeedyComponent extends ConsumerWidget {
  const AddNeedyComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.read(needyFormProvider);
    return ReactiveForm(
        formGroup: form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGroup(
                  controllers: [
                    {
                      "controll": "name",
                      "label": " الاسم الأول",
                      "fildType": FildType.text,
                    },
                    {
                      "controll": "fName",
                      "label": " اسم الأب",
                      "fildType": FildType.text,
                    },
                    {
                      "controll": "sName",
                      "label": "الكنية",
                      "fildType": FildType.text,
                    },
                    {
                      "controll": "bithDay",
                      "label": "مواليد",
                      "fildType": FildType.date,
                    },
                    {
                      "controll": "idType",
                      "label": "نوع الثبوتية",
                      "fildType": FildType.text,
                    },
                    {
                      "controll": "idNumber",
                      "label": "رقم الثبوتية",
                      "fildType": FildType.text,
                    },
                  ],
                  form: form.control("guardianFamily") as FormGroup,
                  title: "ولي أمر الأسرة"),
              SizedBox(
                height: 90.h,
              ),
              _buildGroup(controllers: [
//
                {
                  "controll": "name",
                  "label": " الاسم الأول",
                  "fildType": FildType.text,
                },
                {
                  "controll": "fName",
                  "label": " اسم الأب",
                  "fildType": FildType.text,
                },
                {
                  "controll": "sName",
                  "label": "الكنية",
                  "fildType": FildType.text,
                },
                {
                  "controll": "bithDay",
                  "label": "مواليد",
                  "fildType": FildType.date,
                },
              ], form: form.control("husband") as FormGroup, title: "الزوج/ة"),
              SizedBox(
                height: 90.h,
              ),
              _buildGroup(controllers: [
//
                {
                  "controll": "boy02",
                  "label": "ذكور تحت السنتين",
                  "fildType": FildType.number,
                },
                {
                  "controll": "girl02",
                  "label": "أناث تحت السنتين",
                  "fildType": FildType.number,
                },
                {
                  "controll": "boy210",
                  "label": "ذكور من 2 حتى 10 سنوات",
                  "fildType": FildType.number,
                },
                {
                  "controll": "girl210",
                  "label": "أناث من 2 حتى 10 سنوات",
                  "fildType": FildType.number,
                },
                {
                  "controll": "boy1020",
                  "label": "ذكور من 10 حتى 20 سنة",
                  "fildType": FildType.number,
                },
                {
                  "controll": "girl020",
                  "label": "أناث من 10 حتى 20 سنة",
                  "fildType": FildType.number,
                },
                {
                  "controll": "boy2040",
                  "label": "ذكور من 20 حتى 40 سنة",
                  "fildType": FildType.number,
                },
                {
                  "controll": "gir2040",
                  "label": "أناث من 20 حتى 40 سنة",
                  "fildType": FildType.number,
                },
                {
                  "controll": "boy40",
                  "label": "ذكور أكبر من 40 سنة",
                  "fildType": FildType.number,
                },
                {
                  "controll": "gir40",
                  "label": "أناث أكبر من 40 سنة",
                  "fildType": FildType.number,
                },
              ], form: form.control("children") as FormGroup, title: "الأولاد"),
              SizedBox(
                height: 90.h,
              ),
              _buildGroup(form: form, title: "حالات خاصة", controllers: [
                {
                  "controll": "orphans",
                  "label": "أيتام",
                  "fildType": FildType.number,
                },
                {
                  "controll": "specialNeeds",
                  "label": "ذوي أحتياجات خاصة",
                  "fildType": FildType.number,
                },
              ]),
              SizedBox(
                height: 90.h,
              ),
              // Shr(offset: offset)

              SizedBox(
                height: 500.h,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 500.h,
                      width: MediaQuery.of(context).size.width,
                      child: ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                        return MapNeedyInputComponent(
                        
                          onPressed: (p) async {
                            formGroup.control("goPoint").value = p;
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              _buildGroup(form: form, title: "معلومات الحساب", controllers: [
                {
                  "controll": "username",
                  "label": "اسم المستخدم",
                  "fildType": FildType.text,
                },
                {
                  "controll": "password",
                  "label": "كلمة السر",
                  "fildType": FildType.text,
                },
              ]),
              SizedBox(
                height: 90.h,
              ),
              MainButton(
                text: "حفظ",
                onPressed: () async {
                  if (form.valid) {
                    await ref.read(addNeedyProvider(AddNeedyProviderInput(
                            context: context, formGroup: form))
                        .future);
                  } else {
                    BotToast.showText(text: form.status.name);
                  }
                },
              ),
              SizedBox(
                height: 90.h,
              ),
            ],
          ),
        ));
  }

  Widget _buildGroup(
      {required FormGroup form,
      required String title,
      required List<Map<String, Object>> controllers}) {
    List<Widget> fildes = [Text(title)];
    for (final controll in controllers) {
      fildes.add(_getFilde(controll["controll"] as String,
          controll["label"] as String, controll["fildType"] as FildType));
      fildes.add(SizedBox(
        height: 40.h,
      ));
    }
    return Container(
      padding: EdgeInsets.all(30.sp),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fildes,
        ),
      ),
    );
  }

  Widget _getFilde(String controll, String label, FildType fildType) {
    switch (fildType) {
      case FildType.text:
        return TextBoxFieldWidget(
          controlName: controll,
          label: label,
        );
      case FildType.date:
        return ReactiveDatePickerWidget(
          dateControl: controll,
          label: label,
        );
      case FildType.number:
        return TextBoxFieldWidget(
          controlName: controll,
          label: label,
          keyboardType: TextInputType.number,
        );
    }
  }
}

enum FildType { text, date, number }
