import 'package:takafol/src/benefactor_management/application/index_bottom_provider.dart';


import '../../../core/presentation/widgets/navbar_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BenefactorBottomNavbarComponent extends ConsumerWidget {
  const BenefactorBottomNavbarComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(benefactorBottomNavigationIndexProvider);
    return ClipPath(
      clipper: BottomCurve(),
      child: Material(
        elevation: 30,
        child: Container(
          height: 240.h,
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding:  EdgeInsets.only(right: 20.w, left: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // NavbarIconWidget(
                //     onTap: index != 0
                //         ? () {
                //             ref
                //                 .read(
                //                     benefactorBottomNavigationIndexProvider.notifier)
                //                 .updateIndex(0);
                //           }
                //         : null,
                //     typeIcon:
                //         index == 0 ? TypeIcon.selected : TypeIcon.unSelected,
                //     iconPathOn: "assets/svg/feeds_on.svg",
                //     title: "Feeds",
                //     iconPathOff: "assets/svg/feeds_off.svg"),
                NavbarIconWidget(
                    onTap: () {
                            ref
                                .read(
                                    benefactorBottomNavigationIndexProvider.notifier)
                                .updateIndex(0);
                          }
                      ,
                    typeIcon:
                        index == 0 ? TypeIcon.selected : TypeIcon.unSelected,
                    iconPathOn: "assets/svg/patients_on.svg",
                    title: "البروفايل",
                    iconPathOff: "assets/svg/patients_on.svg"),

                NavbarIconWidget(
                    onTap: 
                         () {
                            ref
                                .read(
                                    benefactorBottomNavigationIndexProvider.notifier)
                                .updateIndex(1);
                          }
                        ,
                    typeIcon:
                        index == 1 ? TypeIcon.selected : TypeIcon.unSelected,
                    iconPathOn: "assets/svg/bell_on.svg",
                    title: "الإشعارات",
                    iconPathOff: "assets/svg/bell_off.svg"),

                NavbarIconWidget(
                    onTap: 
                         () {
                            ref
                                .read(
                                    benefactorBottomNavigationIndexProvider.notifier)
                                .updateIndex(2);
                          }
                        ,
                    typeIcon:
                        index == 2 ? TypeIcon.selected : TypeIcon.unSelected,
                    iconPathOn: "assets/svg/map_on.svg",
                    title: "الخريطة",                
                    iconPathOff: "assets/svg/map_off.svg"),


                NavbarIconWidget(
                    onTap:  () {
                            ref
                                .read(
                                    benefactorBottomNavigationIndexProvider.notifier)
                                .updateIndex(3);
                          }
                        ,
                    typeIcon:
                        index == 3 ? TypeIcon.selected : TypeIcon.unSelected,
                    iconPathOn: "assets/svg/cases_on.svg",
                    title: "التبرعات",
                    iconPathOff: "assets/svg/cases_off.svg"),
              ],
            ),
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
    // path.lineTo(size.width, size.height); // p1
    var firstControlPoint = Offset(size.width/2, size.height / 2); // p2
    var firstTargetPoint = Offset(size.width , 0); // p3
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstTargetPoint.dx, firstTargetPoint.dy);
    path.lineTo(size.width, size.height ); // p4
        path.lineTo(0, size.height ); // p4

    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
