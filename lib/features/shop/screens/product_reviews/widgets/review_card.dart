import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/ratingstar.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(HImages.userProfileImage2),
                ),
                const SizedBox(width: HSizes.spaceBtwItems),
                Text('Johnny Dee',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems),
        //Review
        Row(
          children: [
            const HRatingStar(rating: 4),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text('01 Aug,2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems),
        const ReadMoreText(
          'The User ore the thing is that you can delete only your review not the revies of the other use',
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HColors.primary),
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HColors.primary),
        ),
        const SizedBox(height: HSizes.spaceBtwItems),

        //Company Review
        HRoundedContainer(
          backgroundColor: dark ? HColors.darkGrey : HColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(HSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("H's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("03 Nov,2023",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwItems),
                const ReadMoreText(
                  'The User REvies are here you can add review reply to an existing review and much more the thing is that you can delete only your review not the revies of the other use',
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HColors.primary),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: HSizes.spaceBtwSections),
      ],
    );
  }
}
