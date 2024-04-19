import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        title: Text('Sports'),
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
              HSectionHeading(
                title: 'Sports Shoes',
                onPressed: () {},
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: HSizes.spaceBtwItems),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      const HProductCardHorizontal(),
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
