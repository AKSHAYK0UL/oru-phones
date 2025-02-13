import 'package:flutter/material.dart';
import 'package:oruphones/helper/servicesdata.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: servicePathAndName.length,
        itemBuilder: (context, index) {
          final data = servicePathAndName[index];
          return buildService(context, data);
        },
      ),
    );
  }
}

Widget buildService(BuildContext context, ServicesData data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Transform.scale(
        scale: 1.3,
        child: Image.asset(
          data.path,
          fit: BoxFit.contain,
          height: 90,
          width: 90,
        ),
      ),
      const SizedBox(
        height: 03,
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: 100,
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
