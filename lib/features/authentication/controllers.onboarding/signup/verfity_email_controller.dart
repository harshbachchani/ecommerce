import 'dart:async';

import 'package:ecommerce/common/widgets/success_screen/success_screen1.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send Email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //Send Email Verficatiton link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      HLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check Your inbox and verify your email.');
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  //Timer to automatically redirect an email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: HImages.successfullyRegisterAnimation,
              title: HTextString.yourAccountCreatedTitle,
              subtitle: HTextString.yourAccountCreatedSubTitle,
              onpressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  //Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            image: HImages.successfullyRegisterAnimation,
            title: HTextString.yourAccountCreatedTitle,
            subtitle: HTextString.yourAccountCreatedSubTitle,
            onpressed: () =>
                AuthenticationRepository.instance.screenRedirect()),
      );
    }
  }
}
