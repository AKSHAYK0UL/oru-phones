import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/auth/widget/inputfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              onPressed: () {},
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
                "Sign in to continue",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: screenHeight * 0.105,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Enter Your Phone Number",
                    style: Theme.of(context).textTheme.labelSmall),
              ),
              InputField(),
              SizedBox(
                height: screenHeight * 0.0760,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Accept ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: textBlackColor,
                                ),
                      ),
                      TextSpan(
                        text: "Terms and condition",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: textNavyBlueHexColor01,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ],
                  ),
                ),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(
                height: screenHeight * 0.0101,
              ),
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Next",
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
