import 'package:flutter/widgets.dart';

class AdBanner extends StatelessWidget {
  final String path;
  const AdBanner({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        path,
        fit: BoxFit.fill,
      ),
    );
  }
}
