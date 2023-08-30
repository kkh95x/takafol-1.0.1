import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/presentation/components/voice_component.dart';
import 'package:takafol/src/core/presentation/widgets/date_picker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/images_piker_widget.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/core/presentation/widgets/text_filed_widget.dart';
import 'package:takafol/src/donations_mangement/application/create_donation_provider.dart';
import 'package:takafol/src/donations_mangement/application/donation_form.dart';
import 'package:reactive_flutter_typeahead/reactive_flutter_typeahead.dart';
import 'package:takafol/src/donations_mangement/application/donation_providers.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

class AddDonationComponent extends ConsumerStatefulWidget {
  const AddDonationComponent({super.key, this.needy});
  final AppUser? needy;

  @override
  ConsumerState<AddDonationComponent> createState() =>
      _AddDonationComponentState();
}

class _AddDonationComponentState extends ConsumerState<AddDonationComponent> {
late  TextEditingController controller;
@override
  void initState() {
   controller = TextEditingController(text: "");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    final form = ref.read(donatioonFormProvider);
    return ReactiveForm(
        formGroup: form,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // _buildGroup(form: form, title: title, controllers: controllers)
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ReactiveForm(
                  formGroup: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("تحديد نوع التبرع"),
                      SizedBox(
                        height: 20.h,
                      ),
                      TypeAheadField<String>(
                        hideOnEmpty: true,
                        errorBuilder: (context, error) {
                          return Text(
                            'حدث خطأ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          );
                        },
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground),
                        onSuggestionSelected: (item) {
                          form.control("title").value = item;
                          controller.text = item;
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controller,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Theme.of(context).colorScheme.primary),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10.r)),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: const TextStyle(),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0.r))),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        suggestionsCallback: (pattern) =>
                            ref.read(getDonationsTilte(pattern).future),
                        itemBuilder: (context, suggestion) {
                          return Container(
                            // height: 20.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            padding: EdgeInsets.all(12.sp),
                            child: Text(
                              suggestion,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      TextBoxFieldWidget(
                        lines: 5,
                        controlName: "body",
                        label: "تفاصيل",
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      VoiceComponent(
                          controlName: "voices",
                          forms: form.control("note") as FormGroup),
                      SizedBox(
                        height: 50.h,
                      ),
                      FilePikerWidget(
                          formControlName:
                              form.control("note.images") as FormControl),
                    ],
                  ),
                ),
              ),
              ReactiveFormConsumer(builder: (context, formGroup, child) {
                return MainButton(
                  text: "إنشاء",
                  onPressed:form.valid
                      ? () async {
                         
                          await ref.read(createDonationProvider(
                                  CreateDonationProviderInput(
                                      context: context,
                                      formGroup: form,
                                      needy: widget.needy))
                              .future);
                        }
                      : null,
                );
              })
            ],
          ),
        ));
  }
}
