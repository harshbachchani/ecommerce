import 'package:ecommerce/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingSmoothIndicator extends StatelessWidget {
  const OnBoardingSmoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    bool dark = HHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: HDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: HSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: (value) {
          controller.dotNavigationClick(value);
        },
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? HColors.light : HColors.dark,
          dotHeight: 8,
        ),
      ),
    );
  }
}
