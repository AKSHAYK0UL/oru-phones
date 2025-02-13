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
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final path = brands[index];
          return buildBrandIcon(path);
        },
      ),
    );
  }
}

Widget buildBrandIcon(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: CircleAvatar(
      backgroundColor: greyColor01,
      radius: 50,
      child: Image.asset(
        path,
        fit: BoxFit.fill,
        height: 82,
        width: 82,
      ),
    ),
  );
}
