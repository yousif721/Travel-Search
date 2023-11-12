import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/resources.dart';
import 'custom_text.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final String hintText;
  final bool isLoading;
  final bool withBorder;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final void Function()? onTap;
  final String? Function(T?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final T? value;
  final TextInputType? keyBoardType;
  final AutovalidateMode? autoValidateMode;
  final double? iconSize;
  final bool hasLoadingSuffix;
  final Color? backGround;

  const CustomDropDownField({
    required this.hintText,
    this.onChanged,
    this.onTap,
    this.items,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyBoardType,
    this.value,
    this.autoValidateMode,
    this.iconSize,
    this.backGround,
    this.hasLoadingSuffix = false,
    this.isLoading = false,
    this.withBorder = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged,
      validator: validator,
      value: value,
      onTap: onTap,
      iconSize: iconSize ?? 30.h,
      elevation: 0,
      icon: isLoading
          ? const CircularProgressIndicator(
              color: ColorManager.greyColor,
            )
          : const Icon(
              Icons.keyboard_arrow_down,
              color: ColorManager.greyColor,
            ),
      hint: CustomText(
          text: hintText,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeightManager.light,
              color: ColorManager.primaryColor)),
      isDense: true,
      isExpanded: true,
      autovalidateMode: autoValidateMode,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.primaryColor),

      dropdownColor: ColorManager.sheetColor,
      decoration: InputDecoration(

        fillColor: backGround ?? ColorManager.white,
        filled: true,
        focusColor: ColorManager.redColor,
        enabledBorder:withBorder? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              const BorderSide(color: ColorManager.lightPrimaryColor),
        ):InputBorder.none,
        focusedBorder:withBorder? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              const BorderSide(color: ColorManager.lightPrimaryColor),
        ):InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),


        prefixIcon: prefix != null ? Padding(padding: EdgeInsets.all(AppPadding.p8.w), child: prefix) : null,
        suffixIcon: hasLoadingSuffix ? Padding(
                padding: EdgeInsets.all(AppPadding.p16.w),
                child: SizedBox(
                  width: AppSize.s16.w,
                  height: AppSize.s16.w,
                  child: CircularProgressIndicator(strokeWidth: AppSize.s2.w),
                ),
              ) : suffix != null ? Padding(
                    padding: EdgeInsets.all(AppPadding.p16.w), child: suffix) : null,
      ),
    );
  }
}
