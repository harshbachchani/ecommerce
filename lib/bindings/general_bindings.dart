import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';

import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.lazyPut(() => CartController());
    Get.put(AddressController());
    Get.lazyPut(() => VariationController());
    Get.put(CheckOutController());
    Get.put(OrderController());
  }
}
