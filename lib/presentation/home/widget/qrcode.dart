import 'package:flutter/material.dart';
import 'package:oruphones/constants/constants.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 630,
      width: double.infinity,
      // color: blackColor02,
      child: Stack(
        children: [
          Container(
            height: 550,
            color: blackColor02,
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(
                  "Download App",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildQrcode("assets/qrgoogle.png", () async {
                      await openLink(playstoreUrl);
                    }),
                    buildQrcode("assets/qrapple.png", () async {
                      await openLink(appstoreUrl);
                    }),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  "Invite a Friend",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            right: 30,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                height: 220,
                width: 230,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Invite a friend to ORUphones application.\nTap to copy the respective download link\n to the clipboard",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: blackColor,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      buildlogo("assets/PlayStore.png", () async {
                        await openLink(playstoreUrl);
                      }),
                      buildlogo("assets/AppStore.png", () async {
                        await openLink(appstoreUrl);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> openLink(String path) async {
  if (await canLaunchUrl(Uri.parse(path))) {
    await launchUrl(Uri.parse(path));
  } else {
    throw 'Could not launch X';
  }
}

Widget buildQrcode(String path, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Image.asset(path),
  );
}

Widget buildlogo(String path, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Image.asset(path),
  );
}
