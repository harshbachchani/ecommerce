import 'package:ecommerce/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HSocialButtons extends StatelessWidget {
  const HSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: HColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              height: HSizes.iconMd,
              width: HSizes.iconMd,
              image: AssetImage(HImages.google),
            ),
          ),
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: HColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: HSizes.iconMd,
              width: HSizes.iconMd,
              image: AssetImage(HImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
