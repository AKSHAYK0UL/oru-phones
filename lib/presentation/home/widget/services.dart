import 'package:flutter/material.dart';
import 'package:oruphones/helper/servicesdata.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * 0.19,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: servicePathAndName.length,
        itemBuilder: (context, index) {
          final data = servicePathAndName[index];
          return buildService(context, screenWidth, screenHeight, data);
        },
      ),
    );
  }
}

Widget buildService(
    BuildContext context, double width, height, ServicesData data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        data.path,
        fit: BoxFit.contain,
        height: height * 0.133,
        width: width * 0.262,
      ),
      SizedBox(
        height: height * 0.00550,
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: width * 0.250,
          child: Text(
            data.name,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    ],
  );
}
