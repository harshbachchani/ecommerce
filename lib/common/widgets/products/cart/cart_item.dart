import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HCartItem extends StatelessWidget {
  const HCartItem({super.key, required this.item});
  final CartItemModel item;
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        //Image
        HRoundedImage(
          imageUrl: item.image ?? '',
          width: 40,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(HSizes.sm),
          backgroundColor: dark ? HColors.darkGrey : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        //Title,Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HBrandTitleWithVerifiedIcon(title: item.brandName ?? ''),
              Flexible(
                child: HProudctTitleText(title: item.title, maxLines: 1),
              ),

              //Attributes
              Text.rich(TextSpan(
                  children: (item.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: e.key,
                                style: Theme.of(context).textTheme.bodySmall),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
