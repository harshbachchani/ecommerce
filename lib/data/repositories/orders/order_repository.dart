import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }
      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something Went Wrong while fetching order details.Try again after some time';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something Went wrong while saving order Information. Try again later';
    }
  }
}
