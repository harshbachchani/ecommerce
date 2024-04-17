import 'package:ecommerce/common/widgets/success_screen/success_screen1.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
                "support@TrendifyMart.com",
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
                  onPressed: () => Get.to(() => SuccessScreen(
                        title: HTextString.yourAccountCreatedTitle,
                        subtitle: HTextString.yourAccountCreatedSubTitle,
                        onpressed: () => Get.to(() => const LoginScreen()),
                        image: HImages.staticSuccessIllustration,
                      )),
                  child: const Text(HTextString.tContinue),
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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
