// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CheckBoxWidget extends ConsumerWidget {
  const CheckBoxWidget({
    super.key,
    required this.formControlName,
    required this.label,
  });

  final String formControlName;
  final String label;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveCheckbox(
    
    formControlName: formControlName,
    );
  }
}
