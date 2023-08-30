import 'package:flutter/material.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:reactive_phone_form_field/validators/validation_message.dart';

class PhonePickerWidget extends StatelessWidget {
  const PhonePickerWidget({super.key, this.isFocks = true,required this.formControlName});
  final bool isFocks;
  final String formControlName;
  @override
  Widget build(BuildContext context) {
    return ReactivePhoneFormField<PhoneNumber>(
      initialValue:const PhoneNumber(isoCode: IsoCode.TR,nsn: ""),
      validationMessages: {
          PhoneValidationMessage.required: (error) =>
              "رقم الجوال إجباري",
          PhoneValidationMessage.validMobile: (error) =>
              'صيغة الرقم خاطئة',
        },
      decoration:const InputDecoration(

        label: Text("رقم الجوال"),
        border: OutlineInputBorder()
      ),
      formControlName: formControlName,
      focusNode: isFocks ? FocusNode() : null,
      
    );
  }
}
