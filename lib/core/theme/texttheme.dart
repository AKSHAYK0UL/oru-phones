import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

TextTheme textTheme(double screenHeight) {
  return TextTheme(
    // titleLarge:
    titleMedium: GoogleFonts.poppins(
      color: titleMediumTextColor,
      fontSize: screenHeight * 0.039,
      fontWeight: FontWeight.w600,
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
