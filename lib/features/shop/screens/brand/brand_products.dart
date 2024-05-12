import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
        appBar: HAppBar(
          title: Text(brand.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(HSizes.defaultSpace),
            child: Column(
              children: [
                HBrandCard(showBorder: true, brand: brand),
                const SizedBox(height: HSizes.spaceBtwSections),
                FutureBuilder(
                    future: controller.getBrandProducts(brandId: brand.id),
                    builder: (context, snapshot) {
                      const loader = HVerticalProductShimmer();
                      final widget = HCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final brandProducts = snapshot.data!;
                      return HSortableProducts(products: brandProducts);
                    }),
              ],
            ),
          ),
        ));
  }
}
