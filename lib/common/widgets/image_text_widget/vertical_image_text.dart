import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HVeticalTextImages extends StatelessWidget {
  const HVeticalTextImages({
    super.key,
    required this.image,
    required this.title,
    this.textColor = HColors.white,
    this.backgroundcolor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final bool isNetworkImage;
  final Color? backgroundcolor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HSizes.spaceBtwItems),
        child: Column(
          children: [
            //circular icon
            HCircularImage(
              image: image,
              width: 56,
              height: 56,
              padding: HSizes.sm,
              backgroundColor: backgroundcolor,
              overlaycolor: dark ? HColors.light : HColors.dark,
              isNetworkImage: isNetworkImage,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: HSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
