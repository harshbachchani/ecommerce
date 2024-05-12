import 'package:ecommerce/data/repositories/categories/category_repository.dart';
import 'package:ecommerce/data/repositories/products/product_repository.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source (Firestore,API,etc)
      final categories = await _categoryRepository.getAllCategories();

      //update the category list
      allCategories.assignAll(categories);
      //Filter Featured Categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  // get category or sub-category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
      return [];
    }
  }
}
