import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/allProducts/allproducts.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_brands.dart';

import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HCategoryTab extends StatelessWidget {
  const HCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Brands
              CategoryBrands(category: category),
              const SizedBox(height: HSizes.spaceBtwItems),
              //Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final widget = HCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const HVerticalProductShimmer());
                    if (widget != null) return widget;
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        HSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(
                            () => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            ),
                          ),
                        ),
                        const SizedBox(height: HSizes.spaceBtwItems),
                        HGridLayout(
                          itemcount: products.length,
                          itemBuilder: (_, index) {
                            return HProductCardVertical(
                              product: products[index],
                            );
                          },
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
