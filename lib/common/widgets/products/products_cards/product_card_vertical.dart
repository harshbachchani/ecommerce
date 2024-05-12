import 'package:ecommerce/common/styles/shadows.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:ecommerce/common/widgets/products/favourite_icons/favourite_icon.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_detail/product_detail.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HProductCardVertical extends StatelessWidget {
  const HProductCardVertical({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatePercentage(product.price, product.salePrice);
    final dark = HHelperFunctions.isDarkMode(context);

    return product.id.isEmpty
        ? const Center()
        : InkWell(
            onTap: () => Get.to(() => ProductDetail(product: product)),
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  boxShadow: [HShadowStyle.verticalProductShadow],
                  borderRadius:
                      BorderRadius.circular(HSizes.productImageRadius),
                  color: HHelperFunctions.isDarkMode(context)
                      ? HColors.darkGrey
                      : HColors.white),
              child: Column(
                children: [
                  //Thumbnail,Wishlist Button,Discount Tag
                  HRoundedContainer(
                    height: 180,
                    width: 180,
                    padding: const EdgeInsets.all(HSizes.sm),
                    backgroundColor: dark ? HColors.dark : HColors.light,
                    child: Stack(
                      children: [
                        //Thumbnail Image,
                        Center(
                          child: HRoundedImage(
                            imageUrl: product.thumbanail,
                            applyImageRadius: true,
                            isNetworkImage: true,
                          ),
                        ),
                        //Sale Tag
                        if (salePercentage != null)
                          Positioned(
                            top: 12,
                            child: HRoundedContainer(
                              radius: HSizes.sm,
                              backgroundColor:
                                  HColors.secondary.withOpacity(0.8),
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
                          child: HFavouriteIcon(
                            productId: product.id,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems / 2),
                  //Details

                  Padding(
                    padding: const EdgeInsets.only(left: HSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HProudctTitleText(
                            title: product.title, smallSize: true),
                        const SizedBox(height: HSizes.spaceBtwItems / 2),
                        HBrandTitleWithVerifiedIcon(
                            title: product.brand?.name ?? ''),
                      ],
                    ),
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
                                  '${HTextString.rupeeSign}${product.price.toString()}',
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
                                price: controller.getProductPrice(product),
                              ),
                            )
                          ],
                        ),
                      ),
                      //Add To Cart Button
                      ProductCardAddToCartButton(product: product),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
