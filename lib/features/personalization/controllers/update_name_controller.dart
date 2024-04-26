import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    intializeNames();
    super.onInit();
  }

  Future<void> intializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'We Are Updating your information', HImages.doceranimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        HFullScreenLoader.stoploading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      HFullScreenLoader.stoploading();

      HLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      HFullScreenLoader.stoploading();
      HLoaders.errorSnackBar(title: 'Error in updating  the data');
    }
  }
}
