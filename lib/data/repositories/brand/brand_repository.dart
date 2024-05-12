import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/firebase_storage_service.dart';
import 'package:ecommerce/features/shop/models/brand_category_model.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return result;
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

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(HFirebaseStorageService());
      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);
        final url = await storage.uploadImageData('Brands', file, brand.name);
        brand.image = url;
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      //Extract brandIds from the documents
      List<String> brandIds =
          brandCategoryQuery.docs.map((e) => e['brandId'] as String).toList();

      //Query to get all documents where the brandId is in the list of brandIds,FieldPath.documentId to query documents in collections
      if (brandIds.isNotEmpty) {
        final brandQuery = await _db
            .collection('Brands')
            .where(FieldPath.documentId, whereIn: brandIds)
            .limit(2)
            .get();
        List<BrandModel> brands =
            brandQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
        return brands;
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

  Future<void> uploadDummyBrands(List<BrandCategoryModel> lists) async {
    try {
      for (var brand in lists) {
        await _db.collection('BrandCategory').doc().set(brand.toJson());
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
