
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'image_profile_widget.dart';
class PhotoUserCompenent extends StatelessWidget {
  const PhotoUserCompenent({
    super.key,
    required this.photoControl,
    required this.photoUrlControl,
  });

  final String photoControl;
  final String photoUrlControl;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        return Container(
          margin: const EdgeInsets.only(left: 21.0, right: 21.0).w,
          child: Row(
            children: [
              ImageProfileWidget(
                control: photoControl,
                isEdit: false,
                url: formGroup.control(photoUrlControl).value,
              ),
              Column(
                children: [
                
                  Container(
                      margin: const EdgeInsets.only(left: 7.0).w,
                      child: Text(
                        'إضافة صورة شخصية',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
