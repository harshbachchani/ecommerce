import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.productsCount,
    this.isFeatured = false,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  //Convert Model to json structure so that you can store data in firestore
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'],
      name: data['Name'],
      image: data['Image'],
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? 0,
    );
  }

  factory BrandModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'],
      name: data['Name'],
      image: data['Image'],
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? 0,
    );
  }
}
