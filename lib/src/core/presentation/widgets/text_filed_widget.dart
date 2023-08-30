import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class TextBoxFieldWidget extends ConsumerWidget {
  TextBoxFieldWidget(
      {required this.controlName,
      required this.label,
      this.isSecure,
      this.showPassword,
      this.validationMessages,
      this.inputAction,
      this.textDirection,
      this.keyboardType,
      this.lines = 1,
      super.key});
  final String controlName;
  final String label;
  final bool? isSecure;
  final TextDirection? textDirection;
  void Function()? showPassword;
  final Map<String, String Function(Object)>? validationMessages;
  final TextInputAction? inputAction;
  final TextInputType? keyboardType;
  final int lines;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // if (validationMessages == null ||
    //     validationMessages!.containsKey(ValidationMessage.required)){
    //   validationMessages.[ValidationMessage.required]=(p0) => "حقل مطلوب";
    return ReactiveTextField(
      maxLines: lines,
      keyboardType: keyboardType,
      textDirection: TextDirection.rtl,
      formControlName: controlName,
      obscureText: isSecure ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        suffixIcon: isSecure != null
            ? IconButton(
                onPressed: showPassword ?? () {},
                icon: Icon(
                  isSecure != null && isSecure != false
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
      ),
      validationMessages: validationMessages,
      textInputAction: inputAction ?? TextInputAction.done,
    );
  }
}
