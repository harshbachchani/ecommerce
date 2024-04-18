import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HBillingAddressSection extends StatelessWidget {
  const HBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HSectionHeading(
          title: 'Shipping Address',
          buttontitle: 'Change',
          onPressed: () {},
        ),
        Text('Hello User', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text('6934888832', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text('Mall Road,South Plaza,Delhi',
                style: Theme.of(context).textTheme.bodyMedium, softWrap: true)
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
      ],
    );
  }
}
