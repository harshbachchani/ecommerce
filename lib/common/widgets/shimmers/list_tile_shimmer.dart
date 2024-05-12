import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HListTileShimmer extends StatelessWidget {
  const HListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            HShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(width: HSizes.spaceBtwItems),
            Column(
              children: [
                HShimmerEffect(width: 100, height: 15),
                SizedBox(height: HSizes.spaceBtwItems),
                HShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
