import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/all_cart_item.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: HAppBar(
        showbackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = Center(
          child: HAnimationLoaderWidget(
            text: 'Whoops! Cart Is Empty',
            animation: HImages.cartAnimation,
            showaction: true,
            actiontext: 'Let\'s fill it',
            onactionPressed: () => Get.off(() => const NavigationMenu()),
          ),
        );
        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(HSizes.defaultSpace),
              child: HCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(
                    () => Text(
                        'Checkout ${HTextString.rupeeSign}${cartController.totalCartPrice.value}'),
                  )),
            ),
    );
  }
}
