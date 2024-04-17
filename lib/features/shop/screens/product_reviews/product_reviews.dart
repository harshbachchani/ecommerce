import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/overallproductrating.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/ratingprogressindicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/ratingstar.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/review_card.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        showbackArrow: true,
        title: Text('Reviews & Rating'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: HSizes.spaceBtwItems),

              //Overall Product Ratings
              const HOverallProductRating(),

              const HRatingStar(rating: 4.5),
              Text('12,999', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: HSizes.spaceBtwSections),

              //List of Reviews
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
