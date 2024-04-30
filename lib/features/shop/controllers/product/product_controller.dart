import 'dart:math';

import 'package:ecommerce/data/repositories/products/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;
  static ProductController get instance => Get.find();
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProduct();
      featuredProducts.assignAll(products);
      featuredProducts.refresh();
    } catch (e) {
      HLoaders.errorSnackBar(
          title: 'Oh Snapp!!',
          message: 'Something went wrong while loading the data $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProduct();
      return products;
    } catch (e) {
      HLoaders.errorSnackBar(
          title: 'Oh Snapp!!',
          message: 'Something went wrong while loading the data $e');
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //If no variations
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //Determine the price to consider (sale price if availabe,otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //update smalles and largest price

        smallestPrice = min(priceToConsider, smallestPrice);
        largestPrice = max(largestPrice, priceToConsider);
      }
    }
    return smallestPrice == largestPrice
        ? smallestPrice.toString()
        : '$smallestPrice- $largestPrice';
  }

  String? calculatePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0 || originalPrice <= 0.0) {
      return null;
    }

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out Of Stock';
  }
}
