import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/appbartheme.dart';
import 'package:oruphones/core/theme/buttontheme.dart';
import 'package:oruphones/core/theme/drawertheme.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/core/theme/texttheme.dart';

ThemeData appThemeData(double screenWidth, screenHeight) {
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: appBarTheme,
    textTheme: textTheme(screenHeight),
    elevatedButtonTheme: authElevatedButtonThemeData(screenWidth, screenHeight),
    drawerTheme: drawerThemeData,
  );
}
