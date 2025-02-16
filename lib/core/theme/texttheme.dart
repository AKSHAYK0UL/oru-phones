import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

TextTheme textTheme(double screenHeight) {
  return TextTheme(
    titleMedium: GoogleFonts.poppins(
      color: titleMediumTextColor,
      fontSize: screenHeight * 0.039,
      fontWeight: FontWeight.w600,
    ),

    titleSmall: GoogleFonts.poppins(
      color: titleMediumTextColor,
      fontSize: screenHeight * 0.0200,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: GoogleFonts.poppins(
      color: backgroundColor,
      fontSize: screenHeight * 0.0320,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.poppins(
      color: titleMediumTextColor,
      fontSize: screenHeight * 0.0250,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.poppins(
      color: labeSmallTextColor,
      fontSize: screenHeight * 0.0160,
      fontWeight: FontWeight.w400,
    ),

    // titleSmall:
    labelLarge: GoogleFonts.poppins(
      color: contryCodeColor,
      fontSize: screenHeight * 0.0253,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.poppins(
      color: labelMediumTextColor,
      fontSize: screenHeight * 0.0190,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.poppins(
      color: labeSmallTextColor,
      fontSize: screenHeight * 0.0164,
      fontWeight: FontWeight.w400,
    ),
  );
}
