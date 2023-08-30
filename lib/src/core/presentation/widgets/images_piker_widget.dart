import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

final imagesUrls = StateProvider<List<String>>((ref) => []);

class FilePikerWidget extends ConsumerWidget {
  const FilePikerWidget({super.key, required this.formControlName});
  final FormControl formControlName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgesUrl = ref.watch(imagesUrls);
    formControlName.value = imgesUrl;
    final wdigets = [];
    for (var x in imgesUrl) {
      wdigets.add(Image.file(File(x)));
      wdigets.add(SizedBox(
        height: 10.h,
      ));
      wdigets.add(InkWell(
        onTap: () {
          imgesUrl.remove(x);
          ref.read(imagesUrls.notifier).state=[...imgesUrl];
        },
        
        child: Container(
          width: 100.sp,
          height: 100.sp,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Icon(Icons.delete,color: Colors.blue,),
        ),
      ));
      wdigets.add(SizedBox(
        height: 20.h,
      ));
    }

    return Container(
      child: Column(
        children: [
          ...wdigets,
          ElevatedButton(
              onPressed: imgesUrl.length < 6 ? () => pikImg(ref) : null,
              child: Text("اختر صورة"))
        ],
      ),
    );
  }

  Future<void> pikImg(WidgetRef ref) async {
    final ImagePicker picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      ref.read(imagesUrls.notifier).state = [...ref.read(imagesUrls), img.path];
    }
  }
}

// import 'dart:io';

// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reactive_file_picker/reactive_file_picker.dart';

// class FilePikerWidget extends StatelessWidget {
//   const FilePikerWidget({super.key, required this.formControlaAme});
//   final String formControlaAme;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // constraints: const BoxConstraints(minHeight: 0, maxHeight: 300),
//       height: 900.h,
//       child: ReactiveFilePicker<String>(
//         type: FileType.image,
//         // allowMultiple: true,
//         // allowedExtensions: [".jpg",".png"],
//         formControlName: formControlaAme,
//         filePickerBuilder: (pickImage, files, onChange) {
//           final items = [
//             ...files.files
//                 .asMap()
//                 .map((key, value) => MapEntry(
//                     key,
//                     ListTile(
//                       onTap: () {
//                         onChange(files.copyWith(
//                             files: List<String>.from(files.files)
//                               ..removeAt(key)));
//                       },
//                       leading: const Icon(Icons.delete),
//                       title: FileListItem(value).build(context),
//                     )))
//                 .values,
//             ...files.platformFiles
//                 .asMap()
//                 .map((key, value) => MapEntry(
//                       key,

//                       Column(
//                         children: [
//                           Padding(
//               padding:  EdgeInsets.all(18.0.sp),
//               child: Image.file(
//                 File(value.path!),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             ElevatedButton(onPressed: () {
//                onChange(files.copyWith(
//                               platformFiles:
//                                   List<PlatformFile>.from(files.platformFiles)
//                                     ..removeAt(key)));
//             }, child:const Text("حذف"))
//                         ],
//                       )

//                       // InkWell(
//                       //   onTap: () => onChange(images.copyWith(
//                       //       platformFiles: List<PlatformFile>.from(
//                       //           images.platformFiles)
//                       //         ..removeAt(key))),
//                       //   child: Icon(
//                       //     Icons.delete,
//                       //     color: Colors.white,
//                       //   ),
//                       // ),
//                     ))
//                 .values,
//           ];

//           return Stack(
//             children: [
//               // Column(
//               //   children: items,
//               // ),
//               if(items.isNotEmpty)
//               ListView.builder(
//               physics:const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: items.length,
//                itemBuilder: (context, index) {
//                 return items[index];
//               },)
//               // Expanded(
//               //   child: ListView.builder(
//               //     itemCount: items.length,
//               //     itemBuilder: (_, i) {
//               //       return items[i];
//               //     },
//               //   ),

//                 // GridView.count(
//                 //   crossAxisCount: 3,
//                 //   children: List.generate(items.length, (index) {
//                 //     return items[index];
//                 //   }),
//                 // ),
//               // ),
//               ,
//               Positioned(
//                 bottom: 0,

//                 right: 10,
//                 child: InkWell(
//                   onTap: () {
//                     if (items.length > 5) {
//                       BotToast.showText(text: "لايمكن تحديد أكثر من 6 صور");
//                     } else {
//                       pickImage.call();
//                     }
//                   },
//                   child: Container(
//                     width: 120.sp,
//                     height: 120.sp,
//                     decoration: BoxDecoration(color: Colors.red.shade50,shape: BoxShape.circle),
//                     child:const Icon(Icons.add)),
//                 ),
//               ),
//             ],
//           );
//         },
//         decoration: const InputDecoration(
//           labelText: 'الصور',
//           border: OutlineInputBorder(),
//           helperText: '',
//         ),
//       ),
//     );

//     // ReactiveFilePicker<String>(
//     //   formControlName: formControlaAme,
//     //   type: FileType.image,
//     //   filePickerBuilder: (pickImage, files, onChange) {
//     //     final items = [
//     //       ...files.files
//     //           .asMap()
//     //           .map((key, value) => MapEntry(
//     //               key,
//     //               ListTile(
//     //                 onTap: () {
//     //                   onChange(files.copyWith(
//     //                       files: List<String>.from(files.files)
//     //                         ..removeAt(key)));
//     //                 },
//     //                 leading: const Icon(Icons.delete),
//     //                 title: FileListItem(value).build(context),
//     //               )))
//     //           .values,
//     //       ...files.platformFiles
//     //           .asMap()
//     //           .map((key, value) => MapEntry(
//     //                 key,
//     //                 Container(
//     //                   margin: EdgeInsets.all(20.sp),
//     //                   child: GridTile(
//     //                     footer: IconButton(
//     //                         onPressed: () {
//     //                           onChange(files.copyWith(
//     //                               platformFiles: List<PlatformFile>.from(
//     //                                   files.platformFiles)
//     //                                 ..removeAt(key)));
//     //                         },
//     //                         icon: Container(
//     //                             height: 80.r,
//     //                             width: 80.r,
//     //                             decoration: const BoxDecoration(
//     //                                 color: Colors.grey, shape: BoxShape.circle),
//     //                             child: Icon(
//     //                               Icons.delete,
//     //                               size: 50.sp,
//     //                               color: Colors.red.shade50,
//     //                             ))),
//     //                     child: PlatformFileListItem(value).build(context),
//     //                   ),
//     //                 ),
//     //                 // InkWell(
//     //                 //   onTap: () => onChange(images.copyWith(
//     //                 //       platformFiles: List<PlatformFile>.from(
//     //                 //           images.platformFiles)
//     //                 //         ..removeAt(key))),
//     //                 //   child: Icon(
//     //                 //     Icons.delete,
//     //                 //     color: Colors.white,
//     //                 //   ),
//     //                 // ),
//     //               ))
//     //           .values,
//     //     ];

//     //     return Column(
//     //       children: <Widget>[
//     //         ...items,
//     //         ElevatedButton(
//     //           onPressed: items.length < 6 ? pickImage : null,
//     //           child: const Text(
//     //             'تحديد الصور',
//     //           ),
//     //         ),
//     //       ],
//     //     );

//     //     // Column(
//     //     //   children: [
//     //     //  ListView.builder(
//     //     //   itemCount: items.length,
//     //     //   itemBuilder:(context, index) => items[index],
//     //     //     // shrinkWrap: true,

//     //     // ),
//     //     // ElevatedButton(
//     //     //   onPressed:items.length<6? pickImage:null,
//     //     //   child: const Text("Pick images"),
//     //     // ),
//     //     // ],
//     //     // );
//     //   },
//     //   decoration: const InputDecoration(
//     //     labelText: 'الصور',
//     //     border: OutlineInputBorder(),
//     //     helperText: '',
//     //   ),
//     // );
//   }
// }

// abstract class ListItem {
//   Widget build(BuildContext context);
// }

// class FileListItem extends ListItem {
//   final String url;

//   FileListItem(this.url);

//   @override
//   Widget build(context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20.r),

//       child:  Padding(
//               padding:  EdgeInsets.all(18.0.sp),
//         child: Image.file(

//           File(url),
//           fit: BoxFit.cover,

//         ),
//       ),
//     );
//   }
// }

// class PlatformFileListItem extends ListItem {
//   final PlatformFile platformFile;

//   PlatformFileListItem(this.platformFile);

//   @override
//   Widget build(context) {
//     return platformFile.path != null
//         ? ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(30.r)),

//             child: Padding(
//               padding:  EdgeInsets.all(18.0.sp),
//               child: Image.file(
//                 File(platformFile.path!),
//                 fit: BoxFit.fill,
//               ),
//             ))
//         : Text(platformFile.path ?? "file");
//   }
// }
