import 'package:ecommerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecommerce/features/shop/screens/subcategory/sub_category.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return HVeticalTextImages(
            image: HImages.shoeIcon,
            title: 'Shoes',
            textColor: HColors.accent,
            onTap: () => Get.to(() => const SubCategoryScreen()),
          );
        },
      ),
    );
  }
}
