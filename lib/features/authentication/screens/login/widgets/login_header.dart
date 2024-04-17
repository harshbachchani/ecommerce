import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? HImages.lightAppLogo : HImages.darkAppLogo),
        ),
        Text(HTextString.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: HSizes.sm),
        Text(HTextString.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
