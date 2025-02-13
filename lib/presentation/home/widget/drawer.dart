import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            backgroundColor: greyColor01,
            leading: Image.asset(
              "assets/logo_square1.png",
              height: screenHeight * 0.90,
              width: screenWidth * 0.13,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
        ],
      ),
    );
  }
}
