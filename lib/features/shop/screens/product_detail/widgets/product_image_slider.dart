import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';

import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/favourite_icons/favourite_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';

import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HProductImageSlider extends StatelessWidget {
  const HProductImageSlider({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    final dark = HHelperFunctions.isDarkMode(context);
    return HCurvedEdgeWidget(
      child: Container(
        color:
            dark ? HColors.darkGrey : const Color.fromARGB(255, 215, 213, 213),
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(HSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;

                    return InkWell(
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: HColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            //image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: HSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Obx(() {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return HRoundedImage(
                          isNetworkImage: true,
                          backgroundColor: dark ? HColors.dark : Colors.white,
                          imageUrl: images[index],
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          border: Border.all(
                              color: imageSelected
                                  ? HColors.primary
                                  : Colors.transparent),
                          padding: const EdgeInsets.all(HSizes.sm),
                          width: 80,
                        );
                      });
                    },
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: HSizes.spaceBtwItems)),
              ),
            ),

            //AppBar Icons

            HAppBar(
              showbackArrow: true,
              actions: [
                HFavouriteIcon(
                  productId: product.id,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
