import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HCouponCode extends StatelessWidget {
  const HCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return HRoundedContainer(
      showborder: true,
      backgroundColor: dark ? HColors.dark : HColors.white,
      padding: const EdgeInsets.only(
          top: HSizes.sm, bottom: HSizes.sm, right: HSizes.sm, left: HSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a Promo Code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //Buttons
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? HColors.white.withOpacity(.5)
                    : HColors.dark.withOpacity(.5),
                backgroundColor: Colors.grey.withOpacity(.2),
                side: BorderSide(color: HColors.grey.withOpacity(.1)),
              ),
              onPressed: () {},
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
