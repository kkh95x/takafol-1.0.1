import 'package:takafol/src/admin_management/application/index_nav_provider.dart';
import 'package:takafol/src/benefactor_management/application/index_bottom_provider.dart';


import '../../../core/presentation/widgets/navbar_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminBottomNavbarComponent extends ConsumerWidget {
  const AdminBottomNavbarComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(adminBottomNavigationIndexProvider);
    return ClipPath(
      child: Container(
        height: 190.h,
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding:  EdgeInsets.only(right: 20.w, left: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavbarIconWidget(
                  onTap: 
                       () {
                          ref
                              .read(
                                  adminBottomNavigationIndexProvider.notifier)
                              .updateIndex(0);
                        }
                      ,
                  typeIcon:
                      index == 0 ? TypeIcon.selected : TypeIcon.unSelected,
                  iconPathOn: "assets/svg/profile_on.svg",
                  title: "البروفايل",
                  iconPathOff: "assets/svg/profile_on.svg"),
              NavbarIconWidget(
                  onTap: () {
                          ref
                              .read(
                                  adminBottomNavigationIndexProvider.notifier)
                              .updateIndex(1);
                        }
                    ,
                  typeIcon:
                      index == 1 ? TypeIcon.selected : TypeIcon.unSelected,
                  iconPathOn: "assets/svg/patients_on.svg",
                  title: "المستفيدين",
                  iconPathOff: "assets/svg/patients_on.svg"),
              NavbarIconWidget(
                  onTap: 
                     () {
                          ref
                              .read(
                                  adminBottomNavigationIndexProvider.notifier)
                              .updateIndex(2);
                        }
                      ,
                  typeIcon:
                      index == 2 ? TypeIcon.selected : TypeIcon.unSelected,
                  iconPathOn: "assets/svg/map_on.svg",
                  title: "الخريطة",
                  iconPathOff: "assets/svg/map_on.svg"),
              // NavbarIconWidget(
              //     onTap: index != 3
              //         ? () {
              //             ref
              //                 .read(
              //                     adminBottomNavigationIndexProvider.notifier)
              //                 .updateIndex(3);
              //           }
              //         : null,
              //     typeIcon:
              //         index == 3 ? TypeIcon.selected : TypeIcon.unSelected,
              //     iconPathOn: "assets/svg/chat_list_on.svg",
              //     title: "قريباّ",
              //     iconPathOff: "assets/svg/chat_list_off.svg"),
              // NavbarIconWidget(
              //     onTap: index != 4
              //         ? () {
              //             ref
              //                 .read(
              //                     adminBottomNavigationIndexProvider.notifier)
              //                 .updateIndex(4);
              //           }
              //         : null,
              //     typeIcon:
              //         index == 4 ? TypeIcon.selected : TypeIcon.unSelected,
              //     iconPathOn: "assets/svg/chat_list_on.svg",
              //     title: "قريباّ",
              //     iconPathOff: "assets/svg/chat_list_off.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

// class BottomCurve extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height); // p0
//     path.lineTo(size.width, size.height); // p1
//     var firstControlPoint = Offset(size.width, size.height / 2); // p2
//     var firstTargetPoint = Offset(size.width - 50.w, size.height / 2); // p3
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstTargetPoint.dx, firstTargetPoint.dy);
//     path.lineTo(50.w, size.height / 2); // p4
//     var secondControlPoint = Offset(0, size.height / 2); // p5
//     var secondTargetPoint = const Offset(0, 0); // p6
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondTargetPoint.dx, secondTargetPoint.dy);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
