import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/cart.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HHomeAppBar extends StatelessWidget {
  const HHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HAppBar(
      showbackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HTextString.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: HColors.grey,
                ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const HShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: HColors.white,
                    ),
              );
            }
          }),
        ],
      ),
      actions: [
        HCartCounterIcon(
            onPressed: () => Get.to(() => const CartScreen()),
            iconcolor: HColors.white),
      ],
    );
  }
}
