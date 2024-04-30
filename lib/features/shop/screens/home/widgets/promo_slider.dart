import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/features/shop/controllers/banner_controller.dart';

import 'package:ecommerce/utils/constants/colors.dart';

import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HPromoSlider extends StatelessWidget {
  const HPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const HShimmerEffect(width: double.infinity, height: 190);
        }
        if (controller.allbanners.isEmpty) {
          return const Center(
            child: Text('No data Found'),
          );
        }
        return Column(
          children: [
            CarouselSlider(
              items: controller.allbanners
                  .map(
                    (banner) => HRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  controller.updatePageIndiator(index);
                },
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.allbanners.length; i++)
                    HCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.getcurrPageIndicator() == i
                          ? HColors.primary
                          : HColors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
