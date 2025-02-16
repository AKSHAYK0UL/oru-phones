import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:oruphones/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oruphones/constants/constants.dart';
import 'package:oruphones/core/enum/authenum.dart';
import 'package:oruphones/core/singleton/usersingleton.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/model/auth/user.dart';
import 'package:oruphones/presentation/auth/screen/signin.dart';
import 'package:oruphones/presentation/home/screen/home.dart';
import 'package:oruphones/presentation/home/widget/drawer.dart';
import 'package:oruphones/presentation/home/widget/searchbar.dart';

class Tabbutton extends StatefulWidget {
  static const routeName = "/tabbutton";
  const Tabbutton({super.key});

  @override
  State<Tabbutton> createState() => _TabbuttonState();
}

class _TabbuttonState extends State<Tabbutton> {
  late Box<User> box;
  @override
  void initState() {
    box = Hive.box<User>(hiveBoxUserData);
    if (box.isNotEmpty) {
      context.read<AuthBloc>().add(UpdateUserEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is AuthLoadingState &&
              state.laodingSource == AuthENUM.updateUser) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AuthErrorState &&
              state.errorSource == AuthENUM.updateUser) {
            return Center(child: Text(state.errorMessage));
          }
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
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: blackColor01),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/location.png",
                      fit: BoxFit.fill,
                      height: screenHeight * 0.038,
                      width: screenWidth * 0.0600,
                      color: blackColor01,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.00633,
                        right: screenHeight * 0.019),
                    child: UserSingleton.user != null
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              size: screenHeight * 0.038,
                              color: yellowColor01,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SignIn.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellowColor01,
                              fixedSize: Size(
                                  screenWidth * 2000, screenHeight * 0.0316),
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
                  preferredSize: Size.fromHeight(screenHeight * 0.152),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.0325,
                        vertical: screenHeight * 0.0126),
                    child: Column(
                      children: [
                        const Searchbar(searchValue: ''),
                        SizedBox(height: screenHeight * 0.01267),
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
                            radius: 8,
                            width: screenHeight / 5,
                            contentCenter: true,
                            tabs: const [
                              Tab(text: "Sell Used Phones"),
                              Tab(text: "Buy Used Phones"),
                              Tab(text: "Compare Pricess"),
                              Tab(text: "My Profile"),
                              Tab(text: "My Listings"),
                              Tab(text: "Services"),
                              Tab(text: "Register your Store"),
                              Tab(text: "Get the Apps"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              drawer: BuildDrawer(),
              body: const TabBarView(
                children: [
                  Home(),
                  Home(),
                  Home(),
                  Home(),
                  Home(),
                  Home(),
                  Home(),
                  Home(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
