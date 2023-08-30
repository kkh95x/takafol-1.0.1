import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfileWidget extends ConsumerWidget {
  const ImageProfileWidget(
      {super.key, this.url, this.isEdit, this.control, this.size});
  final bool? isEdit;
  final String? url;
  final String? control;
  final double? size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    XFile img = ref.watch(imageProvider);
    return Stack(
      children: [
        Container(
          width: size ?? 425.w,
          height: size ?? 425.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.r),
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 190.r,
            foregroundImage: img.path == ''
                ? null:
                // : isEdit ?? false
                    // ? 
                    Image.file(File(img.path), fit: BoxFit.cover).image
                    // : null
                    ,
            backgroundImage: url != null
                ? Image.network(
                    url!,
                  ).image
                : Image.asset('assets/png/pic.png').image,
          ),
        ),
        if (isEdit != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.r),
                  color: isEdit == false
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
                width: 104.w,
                height: 104.h,
                child: ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return InkWell(
                      onTap: () async {
                        final img =
                            await ref.read(imageProvider.notifier).pic();
                        formGroup.control(control ?? 'userImformation.photo').value = img;
                      },
                      child: Icon(
                        isEdit == false ? Icons.add : Icons.edit,
                        color: Theme.of(context).colorScheme.onBackground,
                        size: isEdit == false ? 30 : 20,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
final imageProvider = StateNotifierProvider.autoDispose<ImagePic, XFile>((ref) {
  return ImagePic();
});

class ImagePic extends StateNotifier<XFile> {
  ImagePic() : super(XFile(''));

  Future<XFile?> pic() async {
    final ImagePicker picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      state = img;
    }
    return img;
  }
}