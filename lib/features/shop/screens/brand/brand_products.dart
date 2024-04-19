import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: HAppBar(
          title: Text('Nike'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(HSizes.defaultSpace),
            child: Column(
              children: [
                HBrandCard(showBorder: true),
                SizedBox(height: HSizes.spaceBtwSections),
                HSortableProducts(),
              ],
            ),
          ),
        ));
  }
}
