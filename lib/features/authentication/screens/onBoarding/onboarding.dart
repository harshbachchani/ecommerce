import 'package:ecommerce/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/onBoarding/widgets/onboarding_nextbutton.dart';
import 'package:ecommerce/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:ecommerce/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:ecommerce/features/authentication/screens/onBoarding/widgets/onboarding_smoothindicator.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/text_string.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.updatePageIndicator(value);
            },
            children: const [
              OnBoardingPage(
                  image: HImages.onBoardingImage1,
                  title: HTextString.onBoardingTitle1,
                  subtitle: HTextString.onBoardingSubTitle1),
              OnBoardingPage(
                  image: HImages.onBoardingImage2,
                  title: HTextString.onBoardingTitle2,
                  subtitle: HTextString.onBoardingSubTitle2),
              OnBoardingPage(
                  image: HImages.onBoardingImage3,
                  title: HTextString.onBoardingTitle3,
                  subtitle: HTextString.onBoardingSubTitle3),
            ],
          ),
          //skip button
          const OnBoardingSkip(),
          //dot navigation smoothindicator
          const OnBoardingSmoothIndicator(),
          //circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
