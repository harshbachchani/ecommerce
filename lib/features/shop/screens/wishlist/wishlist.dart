import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/favourite_controller.dart';
import 'package:ecommerce/features/shop/screens/home/home.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: HAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          HRoundedIcon(
            data: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = HAnimationLoaderWidget(
                          text: 'Whoops! Wishlist is Empty...',
                          animation: HImages.pencilAnimation,
                          showaction: true,
                          actiontext: 'Let\'s add some',
                          onactionPressed: () {
                            NavigationController.instance.updateindex(0);
                          });
                      const loader = HVerticalProductShimmer(itemCount: 6);
                      final widget = HCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return HGridLayout(
                          itemcount: products.length,
                          itemBuilder: (_, index) {
                            return HProductCardVertical(
                              product: products[index],
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
