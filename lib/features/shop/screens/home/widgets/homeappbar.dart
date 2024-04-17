import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class HHomeAppBar extends StatelessWidget {
  const HHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return HAppBar(
      showbackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HTextString.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: HColors.grey,
                ),
          ),
          Text(
            HTextString.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: HColors.white,
                ),
          ),
        ],
      ),
      actions: [
        HCartCounterIcon(onPressed: () {}, iconcolor: HColors.white),
      ],
    );
  }
}
