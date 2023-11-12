import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_manager.dart';

//for Theme
TextStyle _getTextStyle(double fontSize, FontWeight? fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight ?? FontWeightManager.medium,
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle textFieldTextStyle({
  double fontSize = FontSize.s14,
  Color color = ColorManager.primaryColor,
  FontWeight? fontWeight = FontWeightManager.semiBold,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}
