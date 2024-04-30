import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // Vairable

  RxString selectedProductImage = ''.obs;

  //Get All Images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    //use set to add unique images only
    Set<String> images = {};
    //Load thumbnail Image
    images.add(product.thumbanail);

    //Assign thumbnail as selected image
    selectedProductImage.value = product.thumbanail;

    // Get all images from the produt model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //Get all images from the Product Variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }
    return images.toList();
  }

  // show image popup
  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: HSizes.defaultSpace * 2,
                      horizontal: HSizes.defaultSpace,
                    ),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
