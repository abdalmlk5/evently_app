import 'package:evently_app/cors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface)
    colorScheme: ColorScheme.dark(
      primary: AppColorsDark.mainColor,
      onPrimary: AppColorsDark.inputsColor,
      surface: AppColorsDark.backgroundColor,
      onSurface: AppColorsDark.mainTextColor,
      secondary: AppColorsDark.secondaryTextColor,
      onSecondary: AppColorsDark.inputsColor,
      error: AppColorsDark.redColor,
      outline: AppColorsDark.strokeColor,


    ));
