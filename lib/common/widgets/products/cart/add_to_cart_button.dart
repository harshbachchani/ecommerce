import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_detail/product_detail.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        //If the product have variation then show the product details for variation selection
        //else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneItemToCarT(cartItem);
        } else {
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantityInCart =
              cartController.getProductQuantityInCart(product.id);

          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? HColors.primary : HColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(HSizes.cardRadiusMd),
                bottomRight: Radius.circular(HSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
              width: HSizes.iconLg * 1.2,
              height: HSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: HColors.white),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: HColors.white,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
