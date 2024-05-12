import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/features/shop/controllers/product/favourite_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HFavouriteIcon extends StatelessWidget {
  const HFavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() {
      return HRoundedIcon(
        data: controller.isFavourite(productId)
            ? Iconsax.heart
            : Icons.favorite_outline,
        color: controller.isFavourite(productId) ? HColors.error : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      );
    });
  }
}
