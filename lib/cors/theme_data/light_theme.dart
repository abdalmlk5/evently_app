import 'package:evently_app/cors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface)

  colorScheme: ColorScheme.light(
    primary: AppColorsLight.mainColor,
    onPrimary: AppColorsLight.inputsColor,
    surface: AppColorsLight.backgroundColor,
    onSurface: AppColorsLight.mainTextColor,
    secondary: AppColorsLight.secondaryTextColor,
    onSecondary: AppColorsLight.inputsColor,
    error: AppColorsLight.redColor,
    outline: AppColorsLight.strokeColor,


  )

);
