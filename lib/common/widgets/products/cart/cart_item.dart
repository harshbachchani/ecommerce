import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HCartItem extends StatelessWidget {
  const HCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        //Image
        HRoundedImage(
          imageUrl: HImages.productImage1,
          width: 40,
          height: 60,
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
              const HBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child:
                    HProudctTitleText(title: 'Black Sports Shoes', maxLines: 1),
              ),

              //Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
