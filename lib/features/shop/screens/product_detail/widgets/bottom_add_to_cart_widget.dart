import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HBottomAddToCart extends StatelessWidget {
  const HBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HColors.darkGrey : HColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(HSizes.cardRadiusLg),
            topRight: Radius.circular(HSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              HRoundedIcon(
                data: Iconsax.minus,
                backgroundColor: HColors.darkGrey,
                width: 40,
                height: 40,
                color: HColors.white,
              ),
              const SizedBox(width: HSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: HSizes.spaceBtwItems),
              HRoundedIcon(
                data: Iconsax.add,
                backgroundColor: HColors.black,
                width: 40,
                height: 40,
                color: HColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(HSizes.md),
              backgroundColor: HColors.black,
              side: const BorderSide(color: HColors.black),
            ),
          )
        ],
      ),
    );
  }
}
