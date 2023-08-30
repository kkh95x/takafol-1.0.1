import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';


class Testing extends StatelessWidget {
  const Testing({super.key});
  static String get routeName => "test";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      "phone":FormControl<String>()
    });
    return Scaffold(
      body: Center(
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ ],
          ),
        ),
      ),
    );
  }
}
