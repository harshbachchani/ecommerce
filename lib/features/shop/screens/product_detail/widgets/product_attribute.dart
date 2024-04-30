import 'package:ecommerce/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = HHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          //Selected attribute pricing & Description
          //Display variation price and stock when some variation is selected

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
                            if (controller.selectedVariation.value.salePrice >
                                0)
                              Text(
                                '${HTextString.rupeeSign}${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                            const SizedBox(width: HSizes.spaceBtwItems / 2),
                            //sale price
                            HProductPriceText(
                                price: controller.getVariationPrice()),
                          ],
                        ),

                        //stock
                        Row(
                          children: [
                            const HProudctTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text(controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                HProudctTitleText(
                  title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HSectionHeading(title: attribute.name ?? ''),
                      const SizedBox(height: HSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((value) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  value;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(value);

                              return HChoiceChip(
                                text: value,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? "",
                                            value,
                                          );
                                        }
                                      }
                                    : null,
                              );
                            }).toList()),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
