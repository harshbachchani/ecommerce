import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/products_brand_tag.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';

import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HBrandCard extends StatelessWidget {
  const HBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });
  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    if (brand.id.isEmpty) return const Center();
    return GestureDetector(
      onTap: onTap,
      child: HRoundedContainer(
        padding: const EdgeInsets.all(HSizes.sm),
        showborder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: HCircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlaycolor: HHelperFunctions.getalternateColor(context),
              ),
            ),
            const SizedBox(width: HSizes.spaceBtwItems / 2),

            //Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HBrandTitleWithVerifiedIcon(
                      title: brand.name, brandTextSizes: TextSizes.large),
                  Text('${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
