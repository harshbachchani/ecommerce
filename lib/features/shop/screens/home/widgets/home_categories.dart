import 'package:ecommerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce/common/widgets/shimmers/category_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/screens/subcategory/sub_category.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) return const HCategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
            child: Text(
          'No data found',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ));
      }
      return SizedBox(
        height: 120,
        child: ListView.builder(
          itemCount: controller.featuredCategories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return HVeticalTextImages(
              image: category.image,
              title: category.name,
              textColor: HColors.accent,
              onTap: () => Get.to(() => SubCategoryScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
