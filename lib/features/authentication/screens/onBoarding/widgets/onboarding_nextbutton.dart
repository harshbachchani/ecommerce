import 'package:ecommerce/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = HHelperFunctions.isDarkMode(context);
    return Positioned(
      right: HSizes.defaultSpace,
      bottom: HDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? HColors.primary : HColors.black),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
