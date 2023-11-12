import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/resources.dart';


Widget customText({Key? key,
  String? text,
  Color? color,
  double? fontSize,
  double? height,
  bool underline = false,
  double? letterSpacing,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  TextOverflow? overflow,
  int? maxLines}) {
  return Text(
    text!,
    textAlign: textAlign,
    style: TextStyle(
      decoration: underline ? TextDecoration.underline : null,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? ColorManager.colorCode0F181F,
      fontSize: fontSize?.sp ?? 14.sp,
      fontWeight: fontWeight ?? FontWeightManager.medium,
    ),
    overflow: overflow,
    maxLines: maxLines,
  );
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key,
    this.textStyle,
    required this.text,
    this.textAlign,
    this.overflow,
    this.maxLines})
      : super(key: key);
  final String? text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: textStyle ?? Theme
          .of(context)
          .textTheme
          .titleSmall,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
