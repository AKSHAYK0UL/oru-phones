import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/home/screen/home.dart';
import 'package:oruphones/presentation/home/widget/drawer.dart';
import 'package:oruphones/presentation/home/widget/searchbar.dart';

class Tabbutton extends StatelessWidget {
  const Tabbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return DefaultTabController(
      initialIndex: 0,
      length: 8,
      child: Scaffold(
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
              padding: const EdgeInsets.only(left: 5, right: 15.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowColor01,
                  fixedSize: const Size(80, 25),
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
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(120.0), // adjust height as needed
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.7, vertical: 10),
              child: Column(
                children: [
                  Searchbar(
                    searchValue: '',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: ButtonsTabBar(
                      backgroundColor: backgroundColor,
                      unselectedBackgroundColor: Colors.white,
                      splashColor: greyColor01,
                      borderWidth: 1.5,
                      unselectedBorderColor: greyColor02,
                      borderColor: textinputActiveColor,
                      labelStyle: GoogleFonts.poppins(
                        color: labelMediumTextColor,
                        fontSize: screenHeight * 0.0190,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 0,
                      radius: 08,
                      width: screenHeight / 5,
                      contentCenter: true,
                      tabs: const [
                        Tab(
                          text: "Sell Used Phones",
                        ),
                        Tab(
                          text: "Buy Used Phones",
                        ),
                        Tab(
                          text: "Compare Pricess",
                        ),
                        Tab(
                          text: "My Profile",
                        ),
                        Tab(
                          text: "My Listings",
                        ),
                        Tab(
                          text: "Services",
                        ),
                        Tab(
                          text: "Register your Store",
                        ),
                        Tab(
                          text: "Get the Apps",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: const BuildDrawer(),
        body: TabBarView(
          children: [
            Home(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
