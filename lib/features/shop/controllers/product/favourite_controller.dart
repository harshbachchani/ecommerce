import 'dart:convert';

import 'package:ecommerce/data/repositories/products/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/local_storage/storage_utility.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  //variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = HLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouriteToStorage();
      HLoaders.customSnackBar(
          message: 'Product has been added to the Wishlist.');
    } else {
      HLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouriteToStorage();
      favourites.refresh();
      HLoaders.customSnackBar(
          message: 'Product has been removed from the Wishlist.');
    }
  }

  void saveFavouriteToStorage() {
    final encodedFavourites = json.encode(favourites);
    HLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
