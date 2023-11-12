import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class OutlineBorderIconWidget extends StatelessWidget {
  final IconData? icon;
  final bool isnEnable;

  const OutlineBorderIconWidget({
    required this.icon,
    this.isnEnable = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p4.h,
          horizontal: AppPadding.p8.w,
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: isnEnable
                    ? ColorManager.primaryColor
                    : ColorManager.lightPrimaryColor),
            borderRadius: BorderRadius.circular(15.r)),
        child: Icon(
          icon,
          color: isnEnable
              ? ColorManager.primaryColor
              : ColorManager.lightPrimaryColor,
        ));
  }
}
