import 'package:flutter/material.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';

class HBillingAmountSection extends StatelessWidget {
  const HBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('${HTextString.rupeeSign}256.0',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${HTextString.rupeeSign}20.0',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${HTextString.rupeeSign}10.0',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('${HTextString.rupeeSign}10.0',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
