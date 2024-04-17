import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HProductMetaDeta extends StatelessWidget {
  const HProductMetaDeta({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            //Sale Tag
            HRoundedContainer(
              radius: HSizes.sm,
              backgroundColor: HColors.secondary.withOpacity(.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: HSizes.sm, vertical: HSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: HColors.black),
              ),
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            // Price

            Text(
              '${HTextString.rupeeSign}250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            const HProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        //Title
        const HProudctTitleText(title: 'Green Nike Sports Shoes'),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),
        //Stock Status
        Row(
          children: [
            const HProudctTitleText(title: 'Status'),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),
        //Brand
        Row(
          children: [
            HCircularImage(
              image: HImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlaycolor: dark ? HColors.white : HColors.black,
            ),
            const HBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
