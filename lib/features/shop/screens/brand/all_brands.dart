import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/shimmers/brand_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: const HAppBar(title: Text('Brand'), showbackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const HSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwItems),

              //Brands
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
                    itemcount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return HBrandCard(
                        showBorder: false,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
