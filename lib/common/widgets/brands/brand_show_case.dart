import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HBrandShowCase extends StatelessWidget {
  const HBrandShowCase({super.key, required this.images, required this.brand});
  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: HRoundedContainer(
        showborder: true,
        padding: const EdgeInsets.all(HSizes.md),
        borderColor: HColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand With Products Count
            HBrandCard(showBorder: false, brand: brand),

            //Brand Top 3 Product Images
            Row(
              children: images
                  .map((e) => brandTopProductImageWidget(e, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: HRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(HSizes.md),
        backgroundColor: HHelperFunctions.isDarkMode(context)
            ? HColors.darkGrey
            : HColors.light,
        margin: const EdgeInsets.only(right: HSizes.sm),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadprogress) =>
              const HShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )),
  );
}
