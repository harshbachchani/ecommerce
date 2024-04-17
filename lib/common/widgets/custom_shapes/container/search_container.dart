import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HSearchContainer extends StatelessWidget {
  const HSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showbackground = true,
    this.showborder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool showbackground, showborder;
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(HSizes.md),
          decoration: BoxDecoration(
            color: showbackground
                ? dark
                    ? HColors.dark
                    : HColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(HSizes.cardRadiusLg),
            border: showborder ? Border.all(color: HColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: !dark ? HColors.darkGrey : HColors.grey),
              const SizedBox(width: HSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
