import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class FilterButton extends StatelessWidget {
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String text;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: screenHeight * 0.052,
      width: screenWidth * 0.2500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: greyColor04,
          width: 1.5,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              prefixIcon,
              color: blackColor03,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: blackColor03,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            Icon(
              suffixIcon,
              color: blackColor03,
            ),
          ],
        ),
      ),
    );
  }
}
