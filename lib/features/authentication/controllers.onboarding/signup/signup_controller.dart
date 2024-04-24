import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/signup/verfify_email.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  //Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  //Signup
  void signUp() async {
    try {
      //start loading
      HFullScreenLoader.openLoadingDialog(
          'We are processing your information....', HImages.doceranimation);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }
      //Form Validation
      if (!signupFormkey.currentState!.validate()) {
        HFullScreenLoader.stoploading();
        return;
      }
      if (!privacyPolicy.value) {
        HLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must accept our privacy policy!',
        );
        HFullScreenLoader.stoploading();
        return;
      }
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //save authenticated user data in the Firebase Firestore
      final newuser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phonenumber: phonenumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveuserRecord(newuser);
      HFullScreenLoader.stoploading();
      HLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');
      //show success Message
      //Move to verify Email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));

      //Register User in the Firebase Authentication & save user data in the firebase
    } catch (e) {
      //show some generic error to the user
      HFullScreenLoader.stoploading();
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
    //privacy policy check
  }
  //stop the currently open loading dialog
  //this method doesn't return anything
}
