import 'package:evently_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  AppStyles._();

  static final TextStyle primary18500 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.mainColor,
  );
  static final TextStyle black20600 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.mainTextColor,
  );
  static final TextStyle black16400 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.mainTextColor,
  );
  static final TextStyle black14600 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.thirdTextColor,
  );
  static final TextStyle gray16400 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.secondaryTextColor,
  );
  static final TextStyle white20500 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
