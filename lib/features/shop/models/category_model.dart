import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
    required this.name,
  });

  //Empty helper function
  static CategoryModel empty() => CategoryModel(
        id: '',
        image: '',
        isFeatured: false,
        name: '',
      );

  //convert model to json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'ParentId': parentId,
      'isFeatured': isFeatured,
      'Image': image,
    };
  }

  //Map json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return CategoryModel(
          id: document.id,
          image: data!['Image'] ?? '',
          isFeatured: data['isFeatured'] ?? false,
          parentId: data['ParentId'],
          name: data['Name'] ?? '');
    }
    return CategoryModel.empty();
  }
}
