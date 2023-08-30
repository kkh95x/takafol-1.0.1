import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TypeIcon { selected, unSelected }

class NavbarIconWidget extends StatelessWidget {
  const NavbarIconWidget({
    super.key,
    this.onTap,
    required this.typeIcon,
    required this.iconPathOn,
    required this.title,
    required this.iconPathOff,
  });
  final String iconPathOn;
  final Function()? onTap;
  final String iconPathOff;
  final TypeIcon typeIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              typeIcon == TypeIcon.selected ? iconPathOn : iconPathOff,
              width: 80.w,
              height: 80.h,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: typeIcon == TypeIcon.selected ? const Color(0xffA3C8CF) :Theme.of(context).colorScheme.onBackground ,fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
