import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/model/faq/faq.dart';

class FaqTitle extends StatelessWidget {
  final FAQ data;
  FaqTitle({super.key, required this.data});

  final ValueNotifier<bool> isOpen = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isOpen,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: greyColor03),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: greyColor03),
            ),
            onExpansionChanged: (bool expanded) {
              isOpen.value = expanded;
            },
            title: Text(
              data.question,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: blackColor),
            ),
            trailing: Icon(value ? Icons.close : Icons.add),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(data.answer,
                    style: Theme.of(context).textTheme.labelSmall),
              ),
            ],
          ),
        );
      },
    );
  }
}
