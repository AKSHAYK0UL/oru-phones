import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oruphones/core/enum/authenum.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/core/ui_component/toast.dart';
import 'package:oruphones/model/auth/createotp.dart';
import 'package:oruphones/presentation/auth/screen/username.dart';
import 'package:oruphones/presentation/auth/widget/otptextfield.dart';
import 'package:oruphones/presentation/home/screen/tabbutton.dart';

// ignore: must_be_immutable
class VerifyOtp extends StatefulWidget {
  static const routeName = "/verify-otp";
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otpValue = "";

  @override
  Widget build(BuildContext context) {
    final phoneNumber =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.0152),
            child: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
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
              SizedBox(height: screenHeight * 0.0185),
              Text(
                "Verify Mobile No.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: screenHeight * 0.00633),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Please enter the 4 digit verification code sent to your mobile ",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: "+91-$phoneNumber ",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: "via ",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: "SMS",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.105),
              OTPTextField(
                otpValue: (value) {
                  otpValue = value;
                },
              ),
              SizedBox(height: screenHeight * 0.105),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Didn't receive OTP?\n",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: contryCodeColor),
                    ),
                    TextSpan(
                      text: "Resend OTP ",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            color: blackColor01,
                          ),
                    ),
                    TextSpan(
                      text: "0:23 Sec",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: blackColor01),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.120),
              BlocConsumer<AuthBloc, AuthState>(
                buildWhen: (previous, current) => current != previous,
                listenWhen: (previous, current) => current != previous,
                listener: (context, state) {
                  if (state is AuthSuccessState &&
                      state.successSource == AuthENUM.newUser) {
                    Navigator.of(context).pushNamed(UserName.routeName);
                  }
                  if (state is AuthSuccessState &&
                      state.successSource == AuthENUM.userExist) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Tabbutton.routeName,
                      (Route<dynamic> route) => false,
                    );
                  }
                  if (state is AuthErrorState &&
                      state.errorSource == AuthENUM.verifyOTP) {
                    showToast("Invalid OTP");
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState &&
                      state.laodingSource == AuthENUM.verifyOTP) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      if (otpValue.isEmpty) {
                        showToast("Enter OTP");
                        return;
                      }
                      context.read<AuthBloc>().add(
                            VerifyOTPEvent(
                              data: OTPRequest(
                                countryCode: "91",
                                mobileNumber: phoneNumber,
                                otp: otpValue,
                              ),
                            ),
                          );
                    },
                    child: Text(
                      "Verify OTP",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.0253,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
