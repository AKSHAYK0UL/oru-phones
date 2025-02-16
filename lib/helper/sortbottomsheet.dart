import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/presentation/home/widget/sort.dart';

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet<int?>(
    context: context,
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return const SortBottomSheet();
    },
  ).then((selectedOption) {
    debugPrint('Selected option index: $selectedOption');
  });
}
