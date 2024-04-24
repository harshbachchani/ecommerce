import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/authentication/controllers.onboarding/signup/verfity_email_controller.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: const AssetImage(HImages.deliveredEmailIllustration),
                width: HHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              //Title & Subtitle
              Text(
                HTextString.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              Text(
                HTextString.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              //Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(HTextString.tContinue),
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(HTextString.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
