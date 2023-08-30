// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDatePickerWidget extends ConsumerWidget {
  const ReactiveDatePickerWidget({
    super.key,
    required this.dateControl,
    required this.label,
  });

  final String dateControl;
  final String label;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveDateTimePicker(
      type: ReactiveDatePickerFieldType.date,
      
      validationMessages: {
                         ValidationMessage.required: (p0) => "حقل مطلوب",},
      showClearIcon: true,
      formControlName: dateControl,
      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.only(right: 30.w),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color:
               Colors.black,
            fontWeight: FontWeight.w400),
            border:const OutlineInputBorder()
      ),
    );
  }
}
