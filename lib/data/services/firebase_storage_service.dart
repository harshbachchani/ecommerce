import 'dart:io';

import 'package:ecommerce/utils/popups/loader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HFirebaseStorageService extends GetxController {
  static HFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  //upload local assets from ide

  //return a UIntBList containing  the image data

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  // Upload the image using ImageData on cloud Firebase Storage
  // Return the download URL of the uploaded image

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);

      await ref.putData(image);

      final url = await ref.getDownloadURL();

      return url;
    } catch (e) {
      HLoaders.errorSnackBar(title: e.toString());
      if (e is FirebaseException) {
        throw 'Firebase Exception: $e';
      } else if (e is SocketException) {
        throw 'Network error: $e';
      } else if (e is PlatformException) {
        throw 'Platform Exception: $e';
      } else {
        throw 'Something Went Wrong!!';
      }
    }
  }
}
