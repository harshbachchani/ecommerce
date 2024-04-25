import 'package:ecommerce/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/termsandconditionscheckbox.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/validators/validaton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  expands: false,
                  validator: (value) =>
                      HValidator.validateEmptyText('firstName', value),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: HTextString.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: HSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      HValidator.validateEmptyText('lastName', value),
                  controller: controller.lastname,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: HTextString.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) =>
                HValidator.validateEmptyText('username', value),
            controller: controller.username,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: HTextString.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => HValidator.validateEmail(value),
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: HTextString.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phonenumber,
            keyboardType: TextInputType.phone,
            validator: (value) => HValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: HTextString.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => HValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: HTextString.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value ^= true,
                  icon: controller.hidePassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),

          //Terms and condition check box
          const HTermsAndCoditionsCheckbox(),
          const SizedBox(height: HSizes.spaceBtwItems),
          //Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(
                HTextString.createAccount,
              ),
            ),
          )
        ],
      ),
    );
  }
}
