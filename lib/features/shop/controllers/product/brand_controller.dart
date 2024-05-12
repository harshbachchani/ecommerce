import 'package:ecommerce/data/repositories/brand/brand_repository.dart';
import 'package:ecommerce/data/repositories/products/product_repository.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
  RxBool isloading = false.obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isloading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured!));
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);

      return products;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
      return [];
    }
  }

  //Get Brands for Category

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
      return [];
    }
  }
}
