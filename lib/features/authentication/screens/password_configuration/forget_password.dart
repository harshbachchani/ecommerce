import 'package:ecommerce/features/authentication/controllers.onboarding/foreget_password/forget_password_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/validators/validaton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(HTextString.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: HSizes.spaceBtwItems),
            Text(HTextString.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: HSizes.spaceBtwSections * 2),
            //TextField
            Form(
              key: controller.forgetPasswordKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => HValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: HTextString.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            //Submit Button
            const SizedBox(
              height: HSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(HTextString.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
