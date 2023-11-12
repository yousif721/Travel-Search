import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/resources.dart';
import '../../core/resources/styles_manager.dart';
import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? minLines;
  final int? maxLength;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool enableBorder;
  final bool isValidator;
  final String? validatorMessage;
  final String? labelTitle;
  final String? initialValue;
  final Color? fillColor;
  final Widget? prefixIcon;
  final bool isPassword;
  final double? contentVerticalPadding;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final FontWeight? hintWeight;
  final TextCapitalization? capitalization;
  final void Function()? onTap;
  final void Function(String? x)? onChange;
  final String? Function(String?)? validate;

  const CustomTextField(
      {this.controller,
      this.hintText,
      this.hintStyle,
      this.onTap,
      this.labelTitle,
      this.enabled = true,
      this.enableBorder = false,
      this.textInputType,
      this.hintWeight = FontWeightManager.light,
      this.maxLine,
      this.maxLength,
      this.minLines,
      this.textAlign=TextAlign.start,
      this.focusNode,
      this.contentVerticalPadding,
      this.nextNode,
      this.initialValue,
      this.readOnly = false,
      this.prefixIcon,
      this.isPassword = false,
      this.suffixIcon,
      this.onChange,
      this.textInputAction,
      this.isPhoneNumber = false,
      this.isValidator = false,
      this.validatorMessage,
      this.capitalization = TextCapitalization.none,
      this.fillColor,
      this.validate,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelTitle == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomText(
                    textAlign: TextAlign.center,
                    text: widget.labelTitle,
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.black)),
              ),
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          textAlign: widget.textAlign,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLines,
          keyboardType: widget.textInputType ?? TextInputType.text,
          maxLength: widget.isPhoneNumber ? 11 : widget.maxLength,
          focusNode: widget.focusNode,
          initialValue: widget.initialValue,
          obscureText: widget.isPassword ? _obscureText : false,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(widget.nextNode);
          },
          onChanged: widget.onChange,
          //for initially validate
          //autovalidateMode: AutovalidateMode.always,
          inputFormatters: [
            widget.isPhoneNumber
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],
          validator: widget.validate,
          style: textFieldTextStyle(),
          decoration: InputDecoration(
            isDense: true,
            // important line
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.contentVerticalPadding ?? 15.h,
                horizontal: 10.w),
            hintText: widget.hintText ?? '',
            filled: true,
            fillColor: widget.fillColor ?? ColorManager.white,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: _obscureText
                        ? const Icon(
                            Icons.visibility,
                            color: ColorManager.primaryColor,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: ColorManager.primaryColor,
                          ),
                    onPressed: _toggle)
                : widget.suffixIcon,

            suffixIconConstraints:
                const BoxConstraints(minHeight: 0, minWidth: 0),
            counterText: '',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            hintStyle: widget.hintStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeightManager.semiBold,
                    color: ColorManager.primaryColor),
            //textFieldTextStyle(fontWeight: widget.hintWeight ),
            floatingLabelStyle: textFieldTextStyle(),
            counterStyle: textFieldTextStyle(),
            helperStyle: textFieldTextStyle(),
            labelStyle: textFieldTextStyle(),
            errorStyle: const TextStyle(height: 1.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.enableBorder == false
                      ? ColorManager.white
                      : ColorManager.greyBorderColor,
                  width: 2.0),
              borderRadius: BorderRadius.circular(12.r),
            ),

            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
