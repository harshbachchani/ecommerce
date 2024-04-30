import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HProductMetaDeta extends StatelessWidget {
  const HProductMetaDeta({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salepercentage =
        controller.calculatePercentage(product.price, product.salePrice) ?? 25;
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
                '$salepercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: HColors.black),
              ),
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            // Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '${HTextString.rupeeSign}${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: HSizes.spaceBtwItems),
            HProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        //Title
        HProudctTitleText(title: product.title),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),
        //Stock Status
        Row(
          children: [
            const HProudctTitleText(title: 'Status'),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),
        //Brand
        Row(
          children: [
            HCircularImage(
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlaycolor: dark ? HColors.white : HColors.black,
            ),
            HBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
