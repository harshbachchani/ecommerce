import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/local_storage/storage_utility.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = Get.put(VariationController());

  CartController() {
    loadCartItems();
  }
  void addToCart(ProductModel product) {
    //Quantity check
    if (productQuantityInCart.value < 1) {
      HLoaders.customSnackBar(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      HLoaders.customSnackBar(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        HLoaders.warningSnackBar(
            message: 'Selected Variation is out of stock.', title: 'Oh Snap!!');
        return;
      }
    } else {
      if (product.stock < 1) {
        HLoaders.warningSnackBar(
            message: 'Selected Product is out of stock.', title: 'Oh Snap!!');
        return;
      }
    }
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);
    int index = cartItems.indexWhere((element) =>
        element.productId == selectedCartItem.productId &&
        element.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    HLoaders.customSnackBar(message: 'Your Product has been added to the cart');
  }

  void addOneItemToCarT(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        HLoaders.customSnackBar(message: 'Product Removed From The Cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isvariation = variation.id.isNotEmpty;
    final price = isvariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      variationId: variation.id,
      title: product.title,
      price: price,
      image: isvariation ? variation.image : product.thumbanail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isvariation ? variation.attributesValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings =
        cartItems.map((element) => element.toJson()).toList();

    HLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        HLocalStorage.instance().readData<List<dynamic>>('cartItems');

    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variaionId) {
    final foundItem = cartItems.firstWhere(
        (element) =>
            element.productId == productId && element.variationId == variaionId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
