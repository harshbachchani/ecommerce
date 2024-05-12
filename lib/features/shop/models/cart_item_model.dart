class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    return CartItemModel(
      productId: data['productId'],
      quantity: data['quantity'],
      title: data['title'],
      price: data['price'].toDouble(),
      image: data['image'],
      variationId: data['variationId'],
      selectedVariation: data['selectedVariation'] != null
          ? Map<String, String>.from(data['selectedVariation'])
          : null,
    );
  }
}
