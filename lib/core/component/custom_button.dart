import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/resources.dart';
import 'custom_assets_image.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final MainAxisAlignment? buttonAlignment;

  final bool withBorder;

  final bool loading;
  final TextStyle? textStyle;

  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadius? radius;

  final VoidCallback? onTap;

  const CustomButton(
      {Key? key,
      this.buttonText,
      this.icon,
      this.width,
      this.withBorder = false,
      this.height,
      this.buttonAlignment,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
        margin: margin,
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColor)
              : null,
          color: backgroundColor ?? ColorManager.primaryColor,
          borderRadius: radius ??
              BorderRadius.all(
                Radius.circular(8.r),
              ),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          CustomText(
                    textStyle: textStyle ??
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeightManager.medium,
                            height: 1),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: buttonText ?? "",
                  ),
            icon != null
                ? Padding(
              padding: EdgeInsets.all(8.w),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.h,
              ),
            )
                : const SizedBox(),
          ],
        )),
      ),
    );
  }
}
