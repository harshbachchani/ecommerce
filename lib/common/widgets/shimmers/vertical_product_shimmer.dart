import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HVerticalProductShimmer extends StatelessWidget {
  final int itemCount;
  const HVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  @override
  Widget build(BuildContext context) {
    return HGridLayout(
      itemcount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HShimmerEffect(width: 180, height: 180),
            SizedBox(height: HSizes.spaceBtwItems),
            HShimmerEffect(width: 160, height: 15),
            SizedBox(height: HSizes.spaceBtwItems / 2),
            HShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
