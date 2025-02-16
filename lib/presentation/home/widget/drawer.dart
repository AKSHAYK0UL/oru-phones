import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oruphones/core/enum/authenum.dart';
import 'package:oruphones/core/singleton/usersingleton.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/auth/screen/signin.dart';
import 'package:oruphones/presentation/home/screen/tabbutton.dart';

class BuildDrawer extends StatelessWidget {
  BuildDrawer({super.key});
  final currentUser = UserSingleton.user;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            backgroundColor: greyColor01,
            leading: Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Image.asset(
                "assets/logo_square1.png",
                height: screenHeight * 0.90,
                width: screenWidth * 0.13,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context); // Close the drawer
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          if (currentUser != null)
            ListTile(
              tileColor: greyColor01,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: greyColor02,
                child: Icon(
                  Icons.person,
                  color: blackColor,
                ),
              ),
              title: Text(
                currentUser!.userName,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: blackColor,
                    ),
              ),
              subtitle: Text(
                "Joined: ${currentUser!.createdDate}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          const SizedBox(
            height: 22,
          ),
          if (currentUser == null)
            buildButton(
              context: context,
              text: "Login/SignUp",
              color: buttonBackgroundColor,
              textColor: Colors.white,
              ontap: () {
                Navigator.of(context).pushNamed(SignIn.routeName);
              },
            ),
          buildButton(
            context: context,
            text: "Sell Your Phone",
            color: yellowColor01,
            textColor: blackColor,
            ontap: () {},
          ),
          const SizedBox(
            height: 25,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is AuthSuccessState &&
                  state.successSource == AuthENUM.logout) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Tabbutton.routeName,
                  (Route<dynamic> route) => false,
                );
              }
            },
            builder: (context, state) {
              if (state is AuthErrorState &&
                  state.errorSource == AuthENUM.logout) {
                return Center(child: Text(state.errorMessage));
              }

              return const SizedBox();
            },
          ),
          if (currentUser != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogOutEvent());
                  },
                  icon: Icon(
                    Icons.logout,
                    color: blackColor,
                  ),
                  label: Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: blackColor),
                  ),
                ),
              ),
            ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildChip(
                context: context,
                imagePath: "assets/cart.png",
                text: "How to Buy",
                ontap: () {},
              ),
              buildChip(
                context: context,
                imagePath: "assets/hsell.png",
                text: "How to Sell",
                ontap: () {},
              ),
              buildChip(
                context: context,
                imagePath: currentUser == null
                    ? "assets/guide.png"
                    : "assets/return.png",
                text: currentUser == null ? "Oru Guide" : "Return Policy",
                ontap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildChip(
                context: context,
                imagePath: "assets/about.png",
                text: "About Us",
                ontap: () {},
              ),
              buildChip(
                context: context,
                imagePath: "assets/PrivacyPolicy.png",
                text: "Privacy Policy",
                ontap: () {},
              ),
              buildChip(
                context: context,
                imagePath: "assets/faq.png",
                text: "FAQs",
                ontap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Widget buildButton(
    {required BuildContext context,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 05),
    child: SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: color,
        ),
        onPressed: ontap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    ),
  );
}

Widget buildChip(
    {required context,
    required String imagePath,
    required String text,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 70,
      width: 90,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            height: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    ),
  );
}
