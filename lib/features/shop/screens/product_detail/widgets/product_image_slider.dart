import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ecommerce/common/widgets/icons/circular_icons.dart';
import 'package:ecommerce/common/widgets/images/rounded_image.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HProductImageSlider extends StatelessWidget {
  const HProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return HCurvedEdgeWidget(
      child: Container(
        color:
            dark ? HColors.darkGrey : const Color.fromARGB(255, 215, 213, 213),
        child: Stack(
          children: [
            //Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2),
                child: Image(
                  image: AssetImage(HImages.productImage1),
                ),
              ),
            ),
            //image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: HSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return HRoundedImage(
                        backgroundColor: dark ? HColors.dark : Colors.white,
                        imageUrl: HImages.productImage10,
                        border: Border.all(color: HColors.primary),
                        padding: const EdgeInsets.all(HSizes.sm),
                        width: 80,
                      );
                    },
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: HSizes.spaceBtwItems)),
              ),
            ),

            //AppBar Icons

            const HAppBar(
              showbackArrow: true,
              actions: [
                HRoundedIcon(
                  data: Iconsax.heart,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
