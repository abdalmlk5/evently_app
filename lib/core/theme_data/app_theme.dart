import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  scaffoldBackgroundColor: AppColorsLight.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppStyles.white20500,
      backgroundColor: AppColorsLight.mainColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorsLight.inputsColor,
    hintStyle: AppStyles.gray14400,
    prefixIconColor: AppColors.disableColor,
    suffixIconColor: AppColors.disableColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsLight.strokeColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsLight.strokeColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsLight.mainColor),
    ),
  ),
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    labelStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColorsLight.backgroundColor,
    selectedItemColor: AppColorsLight.mainColor,
    unselectedItemColor: AppColors.disableColor,
    showUnselectedLabels: true,
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColorsLight.mainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(50),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColorsLight.mainColor,
    contentTextStyle: AppStyles.white16500,
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColorsLight.backgroundColor,
    headerBackgroundColor: AppColorsLight.mainColor,
    headerForegroundColor: Colors.white,
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColorsLight.mainColor;
      }
      return null;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return AppColorsLight.secondaryTextColor;
    }),
    todayBackgroundColor: WidgetStateProperty.all(
      AppColorsLight.mainColor.withOpacity(0.1),
    ),
    todayForegroundColor: WidgetStateProperty.all(AppColorsLight.mainColor),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: AppColorsLight.backgroundColor,
    hourMinuteColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColorsLight.mainColor;
      }
      return AppColorsLight.inputsColor;
    }),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return AppColorsLight.mainColor;
    }),
    dayPeriodColor: AppColorsLight.mainColor,
    dayPeriodTextColor: Colors.white,
    dialHandColor: AppColorsLight.mainColor,
    dialBackgroundColor: AppColorsLight.inputsColor,
    dialTextColor: AppColorsLight.mainColor,
    entryModeIconColor: AppColorsLight.mainColor,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: AppColorsDark.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppStyles.white20500,
      backgroundColor: AppColorsDark.mainColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorsDark.inputsColor,
    hintStyle: AppStyles.gray14400,
    prefixIconColor: AppColors.disableColor,
    suffixIconColor: AppColors.disableColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsDark.strokeColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsDark.strokeColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColorsDark.mainColor),
    ),
  ),
  chipTheme: ChipThemeData(
    labelStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    side: const BorderSide(color: AppColorsDark.strokeColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColorsDark.backgroundColor,
    selectedIconTheme: IconThemeData(color: AppColorsDark.mainColor),
    unselectedIconTheme: IconThemeData(color: AppColors.disableColor),
    showUnselectedLabels: true,
    selectedItemColor: AppColorsDark.mainColor,
    unselectedItemColor: AppColors.disableColor,
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColorsLight.mainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(50),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColorsDark.mainColor,
    contentTextStyle: AppStyles.white16500,
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColorsDark.backgroundColor,
    headerBackgroundColor: AppColorsDark.mainColor,
    headerForegroundColor: Colors.white,
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColorsDark.mainColor;
      }
      return null;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return AppColorsDark.secondaryTextColor;
    }),
    todayBackgroundColor: WidgetStateProperty.all(
      AppColorsDark.mainColor.withOpacity(0.1),
    ),
    todayForegroundColor: WidgetStateProperty.all(AppColorsDark.mainColor),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: AppColorsDark.backgroundColor,
    hourMinuteColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColorsDark.mainColor;
      }
      return AppColorsDark.inputsColor;
    }),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return AppColorsDark.mainColor;
    }),
    dayPeriodColor: AppColorsDark.mainColor,
    dayPeriodTextColor: Colors.white,
    dialHandColor: AppColorsDark.mainColor,
    dialBackgroundColor: AppColorsDark.inputsColor,
    dialTextColor: Colors.white,
    entryModeIconColor: AppColorsDark.mainColor,
  ),
);
