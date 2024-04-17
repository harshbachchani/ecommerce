import 'package:ecommerce/common/widgets/loginsignup/divider.dart';
import 'package:ecommerce/common/widgets/loginsignup/social.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signupform.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(HTextString.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: HSizes.spaceBtwSections),
              //Form
              const SignUpForm(),
              const SizedBox(height: HSizes.spaceBtwSections),
              //or divider
              const HFormDivider(dividerText: HTextString.orSignUpWith),
              const SizedBox(height: HSizes.spaceBtwSections),
              //social buttons
              const HSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
