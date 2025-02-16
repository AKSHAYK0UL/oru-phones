import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/helper/share.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Text(
            "Or Share",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: blackColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildShareIcon("assets/insta.png", () async {
                await ShareOnSocialMedia.instagram();
              }),
              buildShareIcon("assets/telegram.png", () async {
                await ShareOnSocialMedia.telegram();
              }),
              buildShareIcon("assets/twitter.png", () async {
                await ShareOnSocialMedia.shareOnX();
              }),
              buildShareIcon("assets/whatsapp.png", () async {
                await ShareOnSocialMedia.whatsApp();
              }),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildShareIcon(String path, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Image.asset(path),
  );
}
