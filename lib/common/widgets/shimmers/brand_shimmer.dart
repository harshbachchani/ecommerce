import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

class HBrandShimmer extends StatelessWidget {
  const HBrandShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return HGridLayout(
        mainAxisExtent: 80,
        itemcount: itemCount,
        itemBuilder: (_, __) => const HShimmerEffect(width: 300, height: 80));
  }
}
