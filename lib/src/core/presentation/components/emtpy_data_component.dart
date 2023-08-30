import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyDataComponent extends ConsumerWidget {
  const EmptyDataComponent(
      {super.key, this.text, this.width = 600, this.height = 600,this.textColor=Colors.black});
  final String? text;
  final double width;
  final double height;
  final Color textColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width.r,
      height: height.r,
      padding: const EdgeInsets.all(10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset('assets/json/empty.json',fit: BoxFit.fill),
          ),
          if (text != null)
            Text(
              text!,
              style:  TextStyle(color:textColor),
            )
        ],
      ),
    );
  }
}
