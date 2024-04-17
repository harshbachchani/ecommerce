import 'package:ecommerce/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //Selected attribute pricing & Description
        HRoundedContainer(
          padding: const EdgeInsets.all(HSizes.md),
          backgroundColor: dark ? HColors.darkerGrey : HColors.grey,
          child: Column(
            children: [
              //Title Price and stock status
              Row(
                children: [
                  const HSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: HSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const HProudctTitleText(
                              title: 'Price : ', smallSize: true),
                          Text(
                            '${HTextString.rupeeSign}25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: HSizes.spaceBtwItems / 2),
                          //sale price
                          const HProductPriceText(price: '20'),
                        ],
                      ),

                      //stock
                      Row(
                        children: [
                          const HProudctTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const HProudctTitleText(
                title:
                    'This is the description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: HSizes.spaceBtwItems),

        //Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(title: 'Colors'),
            const SizedBox(height: HSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                HChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'Pink',
                  selected: false,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'Purple',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(title: 'Size'),
            const SizedBox(height: HSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 10,
              children: [
                HChoiceChip(
                  text: 'UK 6',
                  selected: true,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'UK 7',
                  selected: false,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'UK 8',
                  selected: false,
                  onSelected: (value) {},
                ),
                HChoiceChip(
                  text: 'UK 9',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
