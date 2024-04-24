import 'package:ecommerce/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HTermsAndCoditionsCheckbox extends StatelessWidget {
  const HTermsAndCoditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    bool dark = HHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value ^= true,
            ),
          ),
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            maxLines: 2,
            TextSpan(
              children: [
                TextSpan(
                    text: HTextString.iAgreeTo,
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: " ${HTextString.privacyPolicy} ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? HColors.white : HColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? HColors.white : HColors.primary,
                      ),
                ),
                TextSpan(
                  text: "and",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: " ${HTextString.termsOfUse}",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? HColors.white : HColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? HColors.white : HColors.primary,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
