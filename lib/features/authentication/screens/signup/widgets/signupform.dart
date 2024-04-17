import 'package:ecommerce/features/authentication/screens/signup/verfify_email.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/termsandconditionscheckbox.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
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
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: HTextString.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: HTextString.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: HTextString.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: HTextString.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
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
