import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HSortableProducts extends StatelessWidget {
  const HSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),

        const SizedBox(height: HSizes.spaceBtwSections),

        //Products

        HGridLayout(
            itemcount: 10,
            itemBuilder: (_, index) => const HProductCardVertical())
      ],
    );
  }
}
