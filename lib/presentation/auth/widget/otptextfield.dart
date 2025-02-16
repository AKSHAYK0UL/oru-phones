import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class OTPTextField extends StatefulWidget {
  final Function(String) otpValue;
  const OTPTextField({super.key, required this.otpValue});

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.12,
      height: screenHeight * 0.065,
      textStyle: TextStyle(
        fontSize: screenHeight * 0.0253,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: textinputInactiveColor,
          width: 1.5,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(
          color: textinputActiveColor,
          width: 1.5,
        ),
      ),
    );

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      keyboardType: TextInputType.number,
      onChanged: widget.otpValue,
      onCompleted: widget.otpValue,
    );
  }
}
