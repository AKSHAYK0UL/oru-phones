import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/home/widget/banner.dart' as bn;
import 'package:oruphones/presentation/home/widget/brand.dart';
import 'package:oruphones/presentation/home/widget/faqs.dart';
import 'package:oruphones/presentation/home/widget/filter.dart';
import 'package:oruphones/presentation/home/widget/notification_offer.dart';
import 'package:oruphones/presentation/home/widget/products.dart';
import 'package:oruphones/presentation/home/widget/qrcode.dart';
import 'package:oruphones/presentation/home/widget/services.dart';
import 'package:oruphones/presentation/home/widget/share.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isFabVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isFabVisible.value) {
        _isFabVisible.value = false;
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isFabVisible.value) {
        _isFabVisible.value = true;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isFabVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.7, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const bn.Banner(),
                  const SizedBox(height: 20),
                  Text(
                    "What's on your mind?",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: blackColor01),
                  ),
                  const SizedBox(height: 20),
                  const Services(),
                  const SizedBox(height: 20),
                  textWithArrowButton(context, "Top brands", () {}),
                  BrandIcon(),
                  const SizedBox(height: 10),
                  Text(
                    "Best deals in India",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: blackColor01),
                  ),
                  const SizedBox(height: 14),
                  // Filter buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FilterButton(
                        onTap: () {},
                        text: "Sort",
                        prefixIcon: Icons.swap_vert,
                        suffixIcon: Icons.keyboard_arrow_down,
                      ),
                      const SizedBox(width: 13),
                      FilterButton(
                        onTap: () {},
                        text: "Filter",
                        prefixIcon: Icons.tune,
                        suffixIcon: Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Products(),
                  const SizedBox(height: 18),
                  textWithArrowButton(
                      context, "Frequently Asked Questions", () {}),
                  const SizedBox(height: 13),
                  const Faqs(),
                  const SizedBox(height: 13),
                ],
              ),
            ),
            const NotificationOffer(),
            const QRCode(),
            const Share(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _isFabVisible,
        builder: (context, isVisible, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isVisible ? 1.0 : 0.0,
            child: child,
          );
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 60),
            backgroundColor: blackColor02,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                color: yellowColor01,
                width: 4,
              ),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sell",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: yellowColor01,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(width: screenHeight * 0.00633),
              Icon(
                Icons.add,
                color: yellowColor01,
                size: screenHeight * 0.0380,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textWithArrowButton(
    BuildContext context, String text, VoidCallback ontap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: blackColor01),
      ),
      GestureDetector(
        onTap: ontap,
        child: Icon(
          Icons.arrow_forward_ios,
          color: blackColor01,
          size: 20,
        ),
      ),
    ],
  );
}
