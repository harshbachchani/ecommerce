import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userrepository = Get.put(UserRepository());
  //save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameparts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameparts[0],
          lastName: nameparts.length > 1 ? nameparts.sublist(1).join() : '',
          email: userCredential.user!.email ?? '',
          username: username,
          phonenumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        //save user data
        await userrepository.saveuserRecord(user);
      }
    } catch (e) {
      HLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
}
