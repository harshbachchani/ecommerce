import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(HSizes.productImageRadius),
        color: dark ? HColors.darkGrey.withOpacity(.7) : HColors.softGrey,
      ),
      child: Row(
        children: [
          //Thumbnail
          HRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(HSizes.sm),
            backgroundColor: dark
                ? HColors.dark.withOpacity(.6)
                : HColors.grey.withOpacity(.5),
            child: Stack(
              children: [
                //Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: HRoundedImage(
                    imageUrl: HImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),
                //Sale Tag
                Positioned(
                  top: 12,
                  child: HRoundedContainer(
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
                ),
                //Favourite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: HRoundedIcon(
                    data: Iconsax.heart,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          //Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: HSizes.sm, left: HSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HProudctTitleText(
                          title: 'Green Nike Half Sleves Shirt',
                          smallSize: true),
                      SizedBox(height: HSizes.spaceBtwItems / 2),
                      HBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: HProductPriceText(price: '256.0'),
                      ),

                      //Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: HColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(HSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(HSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: HSizes.iconLg * 1.2,
                          height: HSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: HColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
