import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:flutter/material.dart';

class AppColorsLight {
  AppColorsLight._();

  static const Color mainColor = Color(0xFF0E3A99);
  static const Color backgroundColor = Color(0xFFF4F7FF);
  static const Color mainTextColor = Color(0xFF0E3A99);
  static const Color onPrimaryTextColor = Color(0xFF457AED);
  static const Color secondaryTextColor = Color(0xFF1C1C1C);
  static const Color thirdTextColor = Color(0xFF0E3A99);
  static const Color inputsColor = Color(0xFFFFFFFF);
  static const Color strokeColor = Color(0xFFF0F0F0);
}

class AppColorsDark {
  AppColorsDark._();

  static const Color mainColor = Color(0xFF457AED);
  static const Color backgroundColor = Color(0xFF000F30);
  static const Color mainTextColor = Color(0xFFFFFFFF);
  static const Color onPrimaryTextColor = Color(0xFFFFFFFF);
  static const Color secondaryTextColor = Color(0xFFD6D6D6);
  static const Color thirdTextColor = Color(0xFFFFFFFF);
  static const Color inputsColor = Color(0xFF001440);
  static const Color strokeColor = Color(0xFF002D8F);
}

class AppColors {
  AppColors._();
  static bool get _isDark => ThemeProvider.instance?.isDark() ?? false;

  static Color get mainColor =>
      _isDark ? AppColorsDark.mainColor : AppColorsLight.mainColor;

  static Color get backgroundColor =>
      _isDark ? AppColorsDark.backgroundColor : AppColorsLight.backgroundColor;

  static Color get mainTextColor =>
      _isDark ? AppColorsDark.mainTextColor : AppColorsLight.mainTextColor;

  static Color get onPrimaryTextColor => _isDark
      ? AppColorsDark.onPrimaryTextColor
      : AppColorsLight.onPrimaryTextColor;

  static Color get secondaryTextColor => _isDark
      ? AppColorsDark.secondaryTextColor
      : AppColorsLight.secondaryTextColor;

  static Color get thirdTextColor =>
      _isDark ? AppColorsDark.thirdTextColor : AppColorsLight.thirdTextColor;

  static Color get inputsColor =>
      _isDark ? AppColorsDark.inputsColor : AppColorsLight.inputsColor;

  static Color get strokeColor =>
      _isDark ? AppColorsDark.strokeColor : AppColorsLight.strokeColor;

  static const Color redColor = Color(0xFFFF3232);

  static const Color greenColor = Color(0xFF00A81C);

  static const Color disableColor = Color(0xFFB9B9B9);

  static const Color grayColor = Color(0xFFD6D6D6);
}
