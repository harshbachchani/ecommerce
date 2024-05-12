import 'package:ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce/common/widgets/shimmers/box_shimmer.dart';
import 'package:ecommerce/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  final CategoryModel category;
  const CategoryBrands({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              HListTileShimmer(),
              SizedBox(height: HSizes.spaceBtwItems),
              HBoxShimmer(),
              SizedBox(height: HSizes.spaceBtwItems),
            ],
          );
          final widget = HCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return const Center();
          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget = HCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot, loader: loader);
                      if (widget != null) return const Center();
                      final products = snapshot.data!;
                      return HBrandShowCase(
                        images: products.map((e) => e.thumbanail).toList(),
                        brand: brand,
                      );
                    });
              });
        });
  }
}
