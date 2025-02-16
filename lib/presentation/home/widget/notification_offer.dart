import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class NotificationOffer extends StatelessWidget {
  const NotificationOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 40.9,
      ),
      color: Colors.amber,
      height: 250,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Notified About Our\nLatest Offers and Price Drops",
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          buildTextField(context),
        ],
      ),
    );
  }
}

Widget buildTextField(BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      hintText: "Enter your email here",
      filled: true,
      fillColor: Colors.white,
      hintStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: hintTextColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: TextButton(
          style: TextButton.styleFrom(
            fixedSize: const Size(80, 0),
            backgroundColor: blackColor03,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Send",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: greyColor07),
          ),
        ),
      ),
      border: buildOutlineInputBorder(textinputInactiveColor),
      enabledBorder: buildOutlineInputBorder(textinputInactiveColor),
      focusedBorder: buildOutlineInputBorder(textinputActiveColor),
      errorBorder: buildOutlineInputBorder(textinputErrorColor),
      focusedErrorBorder: buildOutlineInputBorder(textinputErrorColor),
    ),
    keyboardType: TextInputType.emailAddress,
    style: Theme.of(context).textTheme.labelLarge,
  );
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(72),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
