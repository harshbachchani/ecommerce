import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String targetScreen;
  String imageUrl;
  bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  //Empty helper function
  static BannerModel empty() => BannerModel(
        targetScreen: '',
        imageUrl: '',
        active: false,
      );

  //convert model to json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Active': active,
      'TargetScreen': targetScreen,
    };
  }

  //Map json oriented document snapshot from Firebase to UserModel
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return BannerModel(
        imageUrl: data!['ImageUrl'] ?? '',
        active: data['Active'] ?? false,
        targetScreen: data['TargetScreen'],
      );
    }
    return BannerModel.empty();
  }
}
