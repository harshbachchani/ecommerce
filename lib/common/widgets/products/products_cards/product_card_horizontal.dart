import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:ecommerce/common/widgets/products/favourite_icons/favourite_icon.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatePercentage(product.price, product.salePrice);
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
                SizedBox(
                  height: 120,
                  width: 120,
                  child: HRoundedImage(
                    isNetworkImage: true,
                    imageUrl: product.thumbanail,
                    applyImageRadius: true,
                  ),
                ),
                //Sale Tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: HRoundedContainer(
                      radius: HSizes.sm,
                      backgroundColor: HColors.secondary.withOpacity(.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: HSizes.sm, vertical: HSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: HColors.black),
                      ),
                    ),
                  ),
                //Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: HFavouriteIcon(productId: product.id),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HProudctTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: HSizes.spaceBtwItems / 2),
                      HBrandTitleWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: HSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: HSizes.sm),
                              child: HProductPriceText(
                                  price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      //Add to Cart
                      ProductCardAddToCartButton(product: product),
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
