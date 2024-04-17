import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  //update current index when page scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  //jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current index & jump to the last page

  void skipPage() {
    Get.offAll(() => const LoginScreen());
  }
}
