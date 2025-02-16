import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.045),
          child: Text("+91 ", style: Theme.of(context).textTheme.labelLarge),
        ),
        hintText: "Mobile Number",
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: hintTextColor),
        border: buildOutlineInputBorder(textinputInactiveColor),
        enabledBorder: buildOutlineInputBorder(textinputInactiveColor),
        focusedBorder: buildOutlineInputBorder(textinputActiveColor),
        errorBorder: buildOutlineInputBorder(textinputErrorColor),
        focusedErrorBorder: buildOutlineInputBorder(textinputErrorColor),
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.labelLarge,
      controller: controller,
      buildCounter: (context,
          {required currentLength, required isFocused, required maxLength}) {
        return null; //hide the maxLength lable
      },
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
