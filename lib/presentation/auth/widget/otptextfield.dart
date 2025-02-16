import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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

    return OtpTextField(
      numberOfFields: 4,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(8),
      enabledBorderColor: textinputInactiveColor,
      focusedBorderColor: textinputActiveColor,
      borderColor: textinputInactiveColor,
      alignment: Alignment.center,
      borderWidth: 1.5,
      keyboardType: TextInputType.number,
      fieldHeight: screenHeight * 0.065,
      fieldWidth: screenWidth * 0.120,
      filled: true,
      onSubmit: widget.otpValue,
    );
  }
}
