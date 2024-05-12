import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HBoxShimmer extends StatelessWidget {
  const HBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
            SizedBox(height: HSizes.spaceBtwItems),
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
            SizedBox(height: HSizes.spaceBtwItems),
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
