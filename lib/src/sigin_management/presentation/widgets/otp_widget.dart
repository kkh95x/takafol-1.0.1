import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_pinput/reactive_pinput.dart';

class OTPWidget extends ConsumerWidget {
  const OTPWidget({super.key, this.margin});
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 20.0, right: 20.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ReactivePinPut<String>(
          formControlName: 'verification.verificationCode',
          length: 6,
          defaultPinTheme: PinTheme(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.transparent),
              color: Colors.grey,
            ),
            textStyle: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
          focusedPinTheme: PinTheme(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.transparent),
              color:Colors.green,
            ),
            textStyle:
                TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          errorPinTheme: PinTheme(
            decoration: BoxDecoration(
              color: const Color(0xFFBA1A1A),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
