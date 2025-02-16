import 'package:flutter/material.dart';
import 'package:oruphones/core/enum/sortenum.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final ValueNotifier<SortENUM?> _selectedSortOption =
      ValueNotifier<SortENUM?>(null);

  @override
  void dispose() {
    _selectedSortOption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "____",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: greyColor06),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sort',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        ValueListenableBuilder<SortENUM?>(
          valueListenable: _selectedSortOption,
          builder: (context, selectedOption, child) {
            return Column(
              children: [
                sortTile(
                  context: context,
                  title: 'Value For Money',
                  sortOption: SortENUM.valueForMoney,
                  selectedOption: selectedOption,
                  onChanged: (option) {
                    _selectedSortOption.value = option;
                  },
                ),
                sortTile(
                  context: context,
                  title: 'Price: High To Low',
                  sortOption: SortENUM.priceHighToLow,
                  selectedOption: selectedOption,
                  onChanged: (option) {
                    _selectedSortOption.value = option;
                  },
                ),
                sortTile(
                  context: context,
                  title: 'Price: Low To High',
                  sortOption: SortENUM.priceLowToHigh,
                  selectedOption: selectedOption,
                  onChanged: (option) {
                    _selectedSortOption.value = option;
                  },
                ),
                sortTile(
                  context: context,
                  title: 'Latest',
                  sortOption: SortENUM.latest,
                  selectedOption: selectedOption,
                  onChanged: (option) {
                    _selectedSortOption.value = option;
                  },
                ),
              ],
            );
          },
        ),
        Divider(height: 1, color: greyColor06),
        ValueListenableBuilder<SortENUM?>(
          valueListenable: _selectedSortOption,
          builder: (context, selectedOption, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _selectedSortOption.value = null;
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(color: yellowColor01),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedOption == null ? null : () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.disabled)) {
                            return greyColor07;
                          }
                          return yellowColor01;
                        },
                      ),
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.black),
                      fixedSize:
                          WidgetStateProperty.all<Size>(const Size(180, 52)),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text('Apply'),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget sortTile({
  required BuildContext context,
  required String title,
  required SortENUM sortOption,
  required SortENUM? selectedOption,
  required ValueChanged<SortENUM> onChanged,
}) {
  final bool isSelected = sortOption == selectedOption;
  return ListTile(
    tileColor:
        isSelected ? const Color.fromRGBO(246, 192, 24, 0.07) : backgroundColor,
    onTap: () => onChanged(sortOption),
    title: Text(title, style: Theme.of(context).textTheme.labelMedium),
    trailing: Radio<SortENUM>(
      activeColor: yellowColor01,
      value: sortOption,
      groupValue: selectedOption,
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    ),
  );
}
