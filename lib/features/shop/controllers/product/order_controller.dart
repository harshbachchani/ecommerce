import 'package:ecommerce/common/widgets/success_screen/success_screen1.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/orders/order_repository.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      HLoaders.warningSnackBar(title: 'Oh snap!!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'Processing Your Order', HImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        HFullScreenLoader.stoploading();
        return;
      }

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now().add(const Duration(days: 7)),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);
      cartController.clearCart();
      HFullScreenLoader.stoploading();
      Get.off(
        () => SuccessScreen(
          image: HImages.orderCompletedAnimation,
          title: 'Payment Success!',
          subtitle: 'Your Item Will be Shipped Soon!!',
          onpressed: () => Get.offAll(
            () => const NavigationMenu(),
          ),
        ),
      );
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }
}
