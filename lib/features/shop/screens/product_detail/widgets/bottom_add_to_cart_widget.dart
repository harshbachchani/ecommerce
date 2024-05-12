import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HBottomAddToCart extends StatelessWidget {
  const HBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = HHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HColors.darkGrey : HColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(HSizes.cardRadiusLg),
            topRight: Radius.circular(HSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HRoundedIcon(
                  data: Iconsax.minus,
                  backgroundColor: HColors.darkGrey,
                  width: 40,
                  height: 40,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                  color: HColors.white,
                ),
                const SizedBox(width: HSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: HSizes.spaceBtwItems),
                HRoundedIcon(
                  data: Iconsax.add,
                  backgroundColor: HColors.black,
                  width: 40,
                  height: 40,
                  color: HColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: HColors.black,
                side: const BorderSide(color: HColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
