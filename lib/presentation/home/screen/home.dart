import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/home/widget/banner.dart' as bn;
import 'package:oruphones/presentation/home/widget/brand.dart';
import 'package:oruphones/presentation/home/widget/faqs.dart';
import 'package:oruphones/presentation/home/widget/filter.dart';
import 'package:oruphones/presentation/home/widget/notification_offer.dart';
import 'package:oruphones/presentation/home/widget/products.dart';
import 'package:oruphones/presentation/home/widget/services.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.7, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const bn.Banner(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "What's on your mind?",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: blackColor01),
              ),

              const SizedBox(
                height: 20,
              ),
              //services
              const Services(),
              const SizedBox(
                height: 20,
              ),
              // top brands
              textWithArrowButton(context, "Top brands", () {}),

              BrandIcon(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Best deals in India",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: blackColor01),
              ),
              const SizedBox(
                height: 14,
              ),
              //filter buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterButton(
                    onTap: () {},
                    text: "Sort",
                    prefixIcon: Icons.swap_vert,
                    suffixIcon: Icons.keyboard_arrow_down,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  FilterButton(
                    onTap: () {},
                    text: "Filter",
                    prefixIcon: Icons.tune,
                    suffixIcon: Icons.keyboard_arrow_down,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Products(),
              const SizedBox(
                height: 18,
              ),
              textWithArrowButton(context, "Frequently Asked Questions", () {}),
              const SizedBox(
                height: 13,
              ),
              const Faqs(),
              const SizedBox(
                height: 13,
              ),
              const NotificationOffer(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
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
