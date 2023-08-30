import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TapBarComponent extends StatelessWidget {
  const TapBarComponent(
      {super.key, required this.formControlName, required this.tabs,required this.title});
  final List<String> tabs;
  final String formControlName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (context, formGroup, child) {
      return SizedBox(
        height: 600.h,
        child: Stack(
          children: [
            Positioned(
              top: 280.h,
              left: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  for (var x in tabs)
                    Expanded(flex: 2, child: _buildTab(x, formGroup)),
                  const Spacer()
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: ClipPath(
                clipper: BottomCurve(),
                child: Container(
                  alignment: Alignment.center,
                  height: 420.h,
                  width: MediaQuery.of(context).size.width,
                  decoration:const BoxDecoration(color: Colors.blue),
                  child: Text(title,style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),
                ),
              ),
            ),
            // Positioned(
            //   top: 200.h,
            //   left: 0,right: 0,
            //    child: Text(title,style: Theme.of(context).textTheme.displaySmall,),)

          ],
        ),
      );
    });
  }

  Widget _buildTab(String name, FormGroup formGroup) {
    final isSelected = name == formGroup.control(formControlName).value;
    return GestureDetector(
      onTap: isSelected
          ? null
          : () {
              formGroup.control(formControlName).value = name;
            },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          // width:isSelected?350.w: 300.h,
          height: isSelected ? 250.h : 200.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade50 : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20.r)),
          child: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class BottomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); // p0
    path.lineTo(0, size.height); // p1
    var firstControlPoint = Offset(size.width / 2, size.height / 2); // p2
    var firstTargetPoint = Offset(size.width, size.height); // p3
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstTargetPoint.dx, firstTargetPoint.dy);
    path.lineTo(size.width, 0); // p4
    path.lineTo(0, 0); // p4

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
