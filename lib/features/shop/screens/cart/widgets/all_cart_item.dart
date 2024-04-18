import 'package:ecommerce/common/widgets/products/cart/add_delete_quantity.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HCartItems extends StatelessWidget {
  const HCartItems({
    super.key,
    this.showaddremovebuttons = true,
  });
  final bool showaddremovebuttons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Column(
          children: [
            const HCartItem(),
            if (showaddremovebuttons)
              const SizedBox(height: HSizes.spaceBtwItems),
            if (showaddremovebuttons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      //Add Remove buttons
                      HAddRemoveQuantityButton(),
                    ],
                  ),
                  HProudctTitleText(title: '256'),
                ],
              ),
          ],
        );
      },
      separatorBuilder: (_, __) =>
          const SizedBox(height: HSizes.spaceBtwSections),
      itemCount: 5,
    );
  }
}
