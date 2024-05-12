import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/firebase_storage_service.dart';
import 'package:ecommerce/features/shop/models/product_category_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get limited featured products
  Future<List<ProductModel>> getFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromQuerySnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(HFirebaseStorageService());

      for (var product in products) {
        final thumbNail =
            await storage.getImageDataFromAssets(product.thumbanail);
        final url = await storage.uploadImageData(
            'Products/Images', thumbNail, product.thumbanail);

        product.thumbanail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesurl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            imagesurl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesurl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            variation.image = url;
          }
        }

        //store produtcts in firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products =
          querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<List<ProductModel>> getProductForCategory(
      {required String categoryId, required int limit}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      List<String> productIds =
          querySnapshot.docs.map((e) => e['productId'] as String).toList();

      if (productIds.isNotEmpty) {
        final productsQuery = await _db
            .collection('Products')
            .where(FieldPath.documentId, whereIn: productIds)
            .get();
        List<ProductModel> products = productsQuery.docs
            .map((e) => ProductModel.fromSnapshot(e))
            .toList();

        return products;
      } else {
        return [];
      }
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }

  Future<void> uploadDummyProducts(List<ProductCategoryModel> lists) async {
    try {
      for (var brand in lists) {
        await _db.collection('ProductCategory').doc().set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatException();
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong!! Please try again ';
    }
  }
}
