import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/common/widgets/shimmers/brand_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: HAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [HCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: HHelperFunctions.getrightColor(context),
                expandedHeight: 430,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(HSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search bar
                      const SizedBox(height: HSizes.spaceBtwItems),
                      const HSearchContainer(
                        text: 'Search in Store',
                        showborder: true,
                        showbackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: HSizes.spaceBtwSections),
                      //Feature Brand
                      HSectionHeading(
                          title: 'Featured Brand',
                          onPressed: () {
                            Get.to(() => const AllBrandScreen());
                          }),
                      const SizedBox(height: HSizes.spaceBtwItems / 1.5),

                      Obx(() {
                        if (brandController.isloading.value) {
                          return const HBrandShimmer();
                        }
                        if (brandController.allBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }

                        return HGridLayout(
                            itemcount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return HBrandCard(
                                showBorder: false,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)),
                              );
                            });
                      })
                    ],
                  ),
                ),
                bottom: HTabBar(
                    tabs: categories
                        .map((category) => Tab(
                              child: Text(category.name),
                            ))
                        .toList()),
              )
            ];
          },
          body: TabBarView(
            children: categories
                .map((element) => HCategoryTab(category: element))
                .toList(),
          ),
        ),
      ),
    );
  }
}
