import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class BrandIcon extends StatelessWidget {
  BrandIcon({super.key});
  final List<String> brands = [
    "assets/brand1.png",
    "assets/brand2.png",
    "assets/brand3.png",
    "assets/brand4.png",
    "assets/brand5.png",
    "assets/brand6.png",
    "assets/brand7.png",
    "assets/Button.png",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * 0.190,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final path = brands[index];
          return buildBrandIcon(path, screenWidth, screenHeight);
        },
      ),
    );
  }
}

Widget buildBrandIcon(String path, double width, height) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: CircleAvatar(
      backgroundColor: greyColor01,
      radius: 50,
      child: Image.asset(
        path,
        fit: BoxFit.fill,
        height: height * 0.103,
        width: width * 0.2050,
      ),
    ),
  );
}
