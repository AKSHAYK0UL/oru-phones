import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

ElevatedButtonThemeData authElevatedButtonThemeData(
    double screenWidth, screenHeight) {
  return ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: buttonBackgroundColor,
      foregroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      fixedSize: Size(
        screenWidth * 1,
        screenHeight * 0.075,
      ),
    ),
  );
}
