import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HBrandShowCase extends StatelessWidget {
  const HBrandShowCase({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return HRoundedContainer(
      showborder: true,
      padding: const EdgeInsets.all(HSizes.md),
      borderColor: HColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand With Products Count
          const HBrandCard(showBorder: false),

          //Brand Top 3 Product Images
          Row(
            children: images
                .map((e) => brandTopProductImageWidget(e, context))
                .toList(),
          )
        ],
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
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
