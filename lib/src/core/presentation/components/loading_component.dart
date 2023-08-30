import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingComponent extends ConsumerWidget {
  const LoadingComponent({super.key, this.text,this.backColor=true});
  final String? text;
  final bool backColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width:text==null? 300.sp:null,
      height: 300.sp,
      padding: const EdgeInsets.all(30).r,
      decoration: BoxDecoration(
          color:backColor? Colors.grey:null,
          borderRadius: BorderRadius.all(Radius.circular(50.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset('assets/json/loading.json'),
          ),
          if (text != null)
            Text(
              text!,
              style:  TextStyle(color:backColor?Colors.white: Colors.black),
            )
        ],
      ),
    );
  }
}
