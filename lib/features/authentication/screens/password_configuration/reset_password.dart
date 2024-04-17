import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassWordScreen extends StatelessWidget {
  const ResetPassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(HImages.deliveredEmailIllustration),
              width: HHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: HSizes.spaceBtwSections),

            //Title & Subtitle
            Text(
              HTextString.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: HSizes.spaceBtwItems),
            Text(
              HTextString.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: HSizes.spaceBtwSections),

            //buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
    );
  }
}
