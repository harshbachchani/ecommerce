import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HHorizontalProductShimmer extends StatelessWidget {
  const HHorizontalProductShimmer({
    super.key,
    this.itemcount = 4,
  });
  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(width: HSizes.spaceBtwItems),
        itemCount: itemcount,
        shrinkWrap: true,
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HShimmerEffect(width: 120, height: 120),
            SizedBox(width: HSizes.spaceBtwItems),
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: HSizes.spaceBtwItems / 2),
                  HShimmerEffect(width: 160, height: 15),
                  SizedBox(height: HSizes.spaceBtwItems / 2),
                  HShimmerEffect(width: 110, height: 15),
                  SizedBox(height: HSizes.spaceBtwItems / 2),
                  HShimmerEffect(width: 90, height: 15),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
