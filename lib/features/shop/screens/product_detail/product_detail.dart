import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce/features/shop/screens/product_detail/widgets/product_attribute.dart';
import 'package:ecommerce/features/shop/screens/product_detail/widgets/product_image_slider.dart';
import 'package:ecommerce/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_detail/widgets/product_rating_share.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
            const HProductImageSlider(),
            //Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: HSizes.defaultSpace,
                  left: HSizes.defaultSpace,
                  bottom: HSizes.defaultSpace),
              child: Column(
                children: [
                  //Rating
                  const HProductRatingShare(),

                  //Price title stock & brand
                  const HProductMetaDeta(),
                  // Attributes
                  const ProductAttributes(),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  // Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  // Description
                  const HSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  const ReadMoreText(
                    'THis is flmakdf asfk fka fdksafns alf snalfnalf aslfnlsa flkadnflsa dflasfnasl hel lfdna dfldfkafdk asflkdnkaf afklamnfskf flaskfdasnmklf alkfmna fdlkasfdoasn fdsa',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'show less',
                    moreStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(CupertinoIcons.right_chevron),
                      ),
                    ],
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
