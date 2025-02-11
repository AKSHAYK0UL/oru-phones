import 'package:flutter/material.dart';
import 'package:oruphones/core/route/route.dart';
import 'package:oruphones/core/theme/apptheme.dart';
import 'package:oruphones/presentation/auth/screen/signin.dart';
import 'package:oruphones/presentation/home/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORU PHONES',
      theme: appThemeData(screenWidth, screenHeight),
      home: const Home(),
      routes: routes(context),
    );
  }
}
