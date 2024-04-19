import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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

                      HGridLayout(
                          itemcount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const HBrandCard(showBorder: false);
                          })
                    ],
                  ),
                ),
                bottom: const HTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              const HCategoryTab(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
