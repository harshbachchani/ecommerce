import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HProductRatingShare extends StatelessWidget {
  const HProductRatingShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star, color: Colors.amber, size: 24),
            const SizedBox(width: HSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            )
          ],
        ),
        //Share Button
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.share, size: HSizes.lg)),
      ],
    );
  }
}
