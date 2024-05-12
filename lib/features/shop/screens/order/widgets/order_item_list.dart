import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce/features/shop/screens/order/widgets/order_details.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HOrderItemList extends StatelessWidget {
  const HOrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    final dark = HHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = HAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: HImages.orderCompletedAnimation,
            showaction: true,
            actiontext: 'Let\'s Fill it',
            onactionPressed: () => Get.off(() => const NavigationMenu()),
          );
          final response = HCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: HSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return HRoundedContainer(
                showborder: true,
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: dark ? HColors.dark : HColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.ship),
                        const SizedBox(width: HSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: HColors.primary,
                                      fontWeightDelta: 1,
                                    ),
                              ),
                              Text(order.formattedOrderDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                Get.to(() => HOrderDetails(order: order)),
                            icon: const Icon(
                              Iconsax.arrow_right_3_copy,
                              size: HSizes.iconSm,
                            ))
                      ],
                    ),
                    const SizedBox(height: HSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Iconsax.tag),
                              const SizedBox(width: HSizes.spaceBtwItems / 2),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: HSizes.spaceBtwItems / 2),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
