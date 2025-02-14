import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class UserNameInputFiled extends StatelessWidget {
  final TextEditingController controller;

  const UserNameInputFiled({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Name",
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
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.labelLarge,
      controller: controller,
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
