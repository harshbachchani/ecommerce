import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbanail;
  bool? isFeatured;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  BrandModel? brand;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbanail,
    required this.productType,
    this.sku,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.categoryId,
    this.isFeatured,
    this.description,
    this.brand,
    this.productAttributes,
    this.productVariations,
  });
  static isEmpty(ProductModel product) {
    if (product.id.isEmpty &&
        product.title.isEmpty &&
        product.productType.isEmpty) return true;
    return false;
  }

  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0,
        thumbanail: '',
        productType: '',
      );

  //Json Format

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbanail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return ProductModel.empty();
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0).toString()),
      thumbanail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      categoryId: data['CategoryId'],
      description: data['Description'],
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0).toString()),
      thumbanail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      categoryId: data['CategoryId'],
      description: data['Description'],
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
