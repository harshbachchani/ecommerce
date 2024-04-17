import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  RxInt carouselcurrindex = 0.obs;

  void updatePageIndiator(val) {
    carouselcurrindex.value = val;
  }

  getcurrPageIndicator() {
    return carouselcurrindex.value;
  }
}
