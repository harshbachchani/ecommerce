import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //varibles
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  //send reset password link
  sendPasswordResetEmail() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'Processing Your Request...', HImages.doceranimation);

      //check interenet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }

      if (!forgetPasswordKey.currentState!.validate()) {
        HFullScreenLoader.stoploading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      HFullScreenLoader.stoploading();

      HLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password');
      Get.to(() => ResetPassWordScreen(email: email.text.trim()));
    } catch (e) {
      HFullScreenLoader.stoploading();
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'Processing Your Request...', HImages.doceranimation);

      //check interenet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      HFullScreenLoader.stoploading();

      HLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password'.tr);
    } catch (e) {
      HFullScreenLoader.stoploading();
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }
}
