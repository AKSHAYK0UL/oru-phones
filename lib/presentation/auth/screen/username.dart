import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/auth/widget/usernameinputfiled.dart';
import 'package:oruphones/presentation/home/screen/home.dart';

class UserName extends StatefulWidget {
  static const routeName = "/username";
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final userNameController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.0152),
            child: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus
                    ?.unfocus(); //close the keyboard
              },
              icon: Icon(
                Icons.close,
                size: screenHeight * 0.039,
                color: closeButtonColor,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.0152),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 260),
                height: MediaQuery.viewInsetsOf(context).bottom > 0
                    ? 0
                    : screenHeight * 0.170,
                child: Image.asset(
                  "assets/oruphone.jpg",
                  height: screenHeight * 0.170,
                  width: screenWidth * 0.50,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0185,
              ),
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: screenHeight * 0.00633,
              ),
              Text(
                "SignUp to continue",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: screenHeight * 0.105,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Please Tell Us Your Name",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextSpan(
                        text: "*",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: redColor01,
                            ),
                      )
                    ],
                  ),
                ),
              ),
              UserNameInputFiled(controller: userNameController),
              SizedBox(
                height: screenHeight * 0.0760,
              ),
              // ValueListenableBuilder(
              //   valueListenable: checkbox,
              //   builder: (context, value, child) {
              //     return Row(
              //       mainAxisSize: MainAxisSize.max,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Checkbox(
              //           value: value,
              //           onChanged: (value) {
              //             checkbox.value = value ?? false;
              //           },
              //         ),
              //         RichText(
              //           text: TextSpan(
              //             children: [
              //               TextSpan(
              //                 text: "Accept ",
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .labelMedium!
              //                     .copyWith(
              //                       color: textBlackColor,
              //                     ),
              //               ),
              //               TextSpan(
              //                 text: "Terms and condition",
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .labelMedium!
              //                     .copyWith(
              //                       color: textNavyBlueHexColor01,
              //                       decoration: TextDecoration.underline,
              //                     ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: screenHeight * 0.0060,
              // ),
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Navigator.of(context).pushNamed(Home.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Confirm Name",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.0253,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.00633),
                    Icon(
                      Icons.arrow_forward,
                      size: screenHeight * 0.0380,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
