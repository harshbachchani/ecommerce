import 'package:ecommerce/common/widgets/products/cart/add_delete_quantity.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HCartItems extends StatelessWidget {
  const HCartItems({
    super.key,
    this.showaddremovebuttons = true,
  });
  final bool showaddremovebuttons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            const SizedBox(height: HSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              HCartItem(item: item),
              if (showaddremovebuttons)
                const SizedBox(height: HSizes.spaceBtwItems),
              if (showaddremovebuttons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        //Add Remove buttons
                        HAddRemoveQuantityButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneItemToCarT(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    HProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
