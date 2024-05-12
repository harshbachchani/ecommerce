import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ecommerce/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/allProducts/allproducts.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: HAppBar(
        title: Text(category.name),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const HRoundedImage(
                imageUrl: HImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),
              //Sub Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = HHorizontalProductShimmer();
                    final widget = HCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      itemCount: subCategories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: category.id),
                            builder: (context, snapshot) {
                              const loader = HHorizontalProductShimmer();
                              final widget =
                                  HCloudHelperFunction.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: loader,
                                nothingFound: const Center(),
                              );
                              if (widget != null) return widget;
                              final products = snapshot.data!;
                              return Column(
                                children: [
                                  HSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(
                                      () => AllProducts(
                                        title: subCategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(
                                                categoryId: subCategory.id,
                                                limit: -1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: HSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                              width: HSizes.spaceBtwItems),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          HProductCardHorizontal(
                                              product: products[index]),
                                      itemCount: products.length,
                                    ),
                                  ),
                                  const SizedBox(height: HSizes.spaceBtwItems),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
