import 'package:flutter/material.dart';
import 'package:oruphones/core/theme/hexcolor.dart';
import 'package:oruphones/core/ui_component/cacaheimage.dart';
import 'package:oruphones/model/product/product.dart' as prod;

// ignore: must_be_immutable
class ProdTile extends StatelessWidget {
  final prod.Listing data;
  ProdTile({super.key, required this.data});
  ValueNotifier<bool> isLiked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Expanded(
            child: GridTile(
              header: _buildHeader(context),
              footer: Container(
                color: const Color.fromRGBO(76, 76, 76, 0.69),
                alignment: Alignment.center,
                height: 23,
                child: Text(
                  "Price Negotiable",
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: greyColor01,
                  ),
                ),
              ),
              child: cacheImage(
                imageUrl: data.imagePath,
                height: 0,
                width: double.infinity,
              ),
            ),
          ),
          _buildInfoSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel(context),
        ValueListenableBuilder(
          valueListenable: isLiked,
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                isLiked.value = !isLiked.value;
              },
              icon: Icon(
                value ? Icons.favorite : Icons.favorite_border,
                color: greyColor01,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          style: BorderStyle.solid,
          color: greyColor02,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Device name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 06, vertical: 01),
            child: Text(
              data.marketingName,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w500, color: blackColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 06, vertical: 01),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Text(
                    "${data.deviceRam}/${data.deviceStorage}",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: greyColor05),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: greyColor05,
                      radius: 2,
                    ),
                  ),
                  Text(
                    data.deviceCondition,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: greyColor05),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 06, vertical: 01),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Text(
                    "₹${data.discountedPrice.toString().padRight(6)}",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: blackColor,
                        ),
                  ),
                  Text(
                    "₹${data.originalPrice.toString()}",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: greyColor05,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "(${data.discountPercentage.round()}% off)",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: redColor02),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25,
              width: double.infinity,
              color: const Color.fromRGBO(223, 223, 223, 0.77),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      data.listingLocation,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      data.listingDate,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildLabel(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
    child: Stack(
      children: [
        Transform.scale(
          scaleX: 1.20,
          scaleY: 1.2,
          child: Image.asset("assets/label.png"),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "ORU",
                style: textTheme.labelSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: "Verified",
                style: textTheme.labelSmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
