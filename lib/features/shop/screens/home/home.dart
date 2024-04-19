import 'package:ecommerce/common/widgets/custom_shapes/container/primaryheadercontainer.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/allProducts/allproducts.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/homeappbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  HHomeAppBar(),
                  SizedBox(height: HSizes.spaceBtwSections),
                  //searchbar
                  HSearchContainer(text: "Search in store "),
                  SizedBox(height: HSizes.spaceBtwSections),

                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        //heading
                        HSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false),
                        SizedBox(height: HSizes.spaceBtwItems),
                        //Categories
                        HomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwSections),

            //Body
            //Container
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  //promo Slider
                  const HPromoSlider(
                    banners: [
                      HImages.promoBanner1,
                      HImages.promoBanner2,
                      HImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  // Heading
                  HSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  //Popular Products
                  HGridLayout(
                      itemcount: 8,
                      itemBuilder: (_, index) => const HProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
