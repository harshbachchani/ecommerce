import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HOrderItemList extends StatelessWidget {
  const HOrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: HSizes.spaceBtwItems),
      itemBuilder: (_, index) => HRoundedContainer(
        showborder: true,
        padding: const EdgeInsets.all(HSizes.md),
        backgroundColor: dark ? HColors.dark : HColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: HSizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: HColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text('22 March 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_3_copy,
                      size: HSizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(height: HSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: HSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('[#43211]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: HSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('23 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
