import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class Searchbar extends StatelessWidget {
  final String searchValue;
  const Searchbar({super.key, required this.searchValue});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.035),
          child: Icon(
            Icons.search,
            color: yelloColor02,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.035),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24, //  height for the divider
                child: VerticalDivider(
                  color: hintTextColor01,
                  thickness: 2,
                ),
              ),
              Icon(
                Icons.mic_none_rounded,
                color: hintTextColor01,
              ),
            ],
          ),
        ),
        hintText: "Search phones with make, model...",
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: hintTextColor01, fontWeight: FontWeight.w500),
        border: buildOutlineInputBorder(textinputInactiveColor),
        enabledBorder: buildOutlineInputBorder(textinputInactiveColor),
        focusedBorder: buildOutlineInputBorder(textinputActiveColor),
        errorBorder: buildOutlineInputBorder(textinputErrorColor),
        focusedErrorBorder: buildOutlineInputBorder(textinputErrorColor),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
