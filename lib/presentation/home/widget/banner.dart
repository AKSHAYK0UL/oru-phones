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
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return buildBanner(paths[index % paths.length]);
            },
            controller: _controller,
          ),
        ),
        const SizedBox(
          height: 08,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: paths.length,
          effect: CustomizableEffect(
            spacing: 8.0,
            dotDecoration: DotDecoration(
              width: 7.5,
              height: 7.5,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7.5),
              dotBorder: DotBorder(color: greyColor03),
            ),
            activeDotDecoration: DotDecoration(
              width: 7.5,
              height: 7.5,
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
