import 'package:ecommerce/data/repositories/categories/category_repository.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
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

  // set category or sub-category products
}
