import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Banner extends StatefulWidget {
  const Banner({super.key});

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  final _controller = PageController();
  late Timer _timer;
  List<String> paths = [
    "assets/Banner1.png",
    "assets/Banner2.png",
    "assets/Banner3.png",
    "assets/Banner4.png",
    "assets/Banner5.png"
  ];
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage = _controller.page!.round() + 1;
      if (nextPage == paths.length) {
        nextPage = 0;
        _controller.jumpToPage(nextPage);
      }
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.220,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return buildBanner(paths[index % paths.length]);
            },
            controller: _controller,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01013,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: paths.length,
          effect: CustomizableEffect(
            spacing: screenHeight * 0.01013,
            dotDecoration: DotDecoration(
              width: screenWidth * 0.018,
              height: screenHeight * 0.0100,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7.5),
              dotBorder: DotBorder(color: greyColor03),
            ),
            activeDotDecoration: DotDecoration(
              width: screenWidth * 0.018,
              height: screenHeight * 0.0100,
              color: greyColor03,
              borderRadius: BorderRadius.circular(7.5),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildBanner(String path) {
  return Image.asset(
    path,
    fit: BoxFit.cover,
  );
}
