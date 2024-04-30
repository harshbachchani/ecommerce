import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/firebase_storage_service.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //vaiables
  final _db = FirebaseFirestore.instance;

  //Get all orders related to current user
  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .limit(3)
          .get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
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

  //upload banners to the cloud firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(HFirebaseStorageService());
      var rng = Random();
      int i = 1;
      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        final url = await storage.uploadImageData('Banners', file, 'banner_$i');
        banner.imageUrl = url;
        i++;
        await _db
            .collection('Banners')
            .doc('banner_${rng.nextInt(1000).toString()}')
            .set(banner.toJson());
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
