import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HAddRemoveQuantityButton extends StatelessWidget {
  const HAddRemoveQuantityButton(
      {super.key, required this.quantity, this.add, this.remove});
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HRoundedIcon(
          data: Iconsax.minus,
          width: 32,
          height: 32,
          size: HSizes.md,
          onPressed: remove,
          color: dark ? HColors.white : HColors.black,
          backgroundColor: dark ? HColors.darkGrey : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: HSizes.spaceBtwItems),
        HRoundedIcon(
          data: Iconsax.add,
          width: 32,
          height: 32,
          size: HSizes.md,
          color: HColors.white,
          backgroundColor: HColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
