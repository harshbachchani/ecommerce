import 'package:ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HCategoryTab extends StatelessWidget {
  const HCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Brands
              const HBrandShowCase(
                images: [
                  HImages.productImage1,
                  HImages.productImage2,
                  HImages.productImage3,
                ],
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              //Products
              HSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: HSizes.spaceBtwItems),

              HGridLayout(
                itemcount: 4,
                itemBuilder: (_, index) {
                  return HProductCardVertical(
                    product: ProductModel.empty(),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
