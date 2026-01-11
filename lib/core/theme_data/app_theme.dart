import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: AppColorsLight.mainColor,
    onPrimary: AppColorsLight.inputsColor,
    surface: AppColorsLight.backgroundColor,
    onSurface: AppColorsLight.mainTextColor,
    secondary: AppColorsLight.secondaryTextColor,
    tertiary: AppColorsLight.thirdTextColor,
    onSecondary: AppColorsLight.inputsColor,
    error: AppColorsLight.redColor,
    outline: AppColorsLight.strokeColor,
  ),
  scaffoldBackgroundColor: AppColorsLight.backgroundColor,
  textTheme: TextTheme(
    titleLarge: AppStyles.black20600,
    titleSmall: AppStyles.black14600,
    bodyLarge: AppStyles.gray16400,
    displayLarge: AppStyles.primary18500,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppStyles.white20500,
      backgroundColor: AppColorsLight.mainColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: AppColorsDark.mainColor,
    onPrimary: AppColorsDark.inputsColor,
    surface: AppColorsDark.backgroundColor,
    onSurface: AppColorsDark.mainTextColor,
    secondary: AppColorsDark.secondaryTextColor,
    tertiary: AppColorsDark.thirdTextColor,

    onSecondary: AppColorsDark.inputsColor,
    error: AppColorsDark.redColor,
    outline: AppColorsDark.strokeColor,
  ),
  scaffoldBackgroundColor: AppColorsDark.backgroundColor,
  textTheme: TextTheme(
    titleLarge: AppStyles.black20600.copyWith(
      color: AppColorsDark.mainTextColor,
    ),
    titleSmall: AppStyles.black14600.copyWith(
      color: AppColorsDark.thirdTextColor,
    ),
    bodyLarge: AppStyles.gray16400.copyWith(
      color: AppColorsDark.secondaryTextColor,
    ),
    displayLarge: AppStyles.primary18500.copyWith(
      color: AppColorsDark.mainColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppStyles.white20500,
      backgroundColor: AppColorsDark.mainColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
);
