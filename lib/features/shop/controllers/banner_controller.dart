import 'package:ecommerce/data/repositories/banners/banner_repository.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> allbanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  RxInt carouselcurrindex = 0.obs;
  RxBool isLoading = false.obs;
  void updatePageIndiator(val) {
    carouselcurrindex.value = val;
  }

  getcurrPageIndicator() {
    return carouselcurrindex.value;
  }

  //fetch banners
  Future<void> fetchBanners() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source (Firestore,API,etc)
      final banners = await _bannerRepository.fetchBanner();

      //update the category list
      allbanners.assignAll(banners);
      allbanners.refresh();
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
