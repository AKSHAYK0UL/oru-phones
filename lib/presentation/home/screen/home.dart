import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/home/widget/drawer.dart';
import 'package:oruphones/presentation/home/widget/searchbar.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Image.asset("assets/menu.png"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Image.asset(
          "assets/oruphone.jpg",
          height: screenHeight * 0.95,
          width: screenWidth * 0.15,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Text(
              "india",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: blackColor01,
                  ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/location.png",
              fit: BoxFit.fill,
              height: 30,
              width: 24,
              color: blackColor01,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 05, right: 15.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor01,
                fixedSize: Size(80, 25),
              ),
              child: Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.7, vertical: 10),
          child: Column(
            children: [
              //search bar
              Searchbar(
                searchValue: '',
              ),
              //tab bar
              //banner
            ],
          ),
        ),
      ),
    );
  }
}
