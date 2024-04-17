import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HElevatedButtonTheme {
  HElevatedButtonTheme._();

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.light,
      backgroundColor: HColors.primary,
      disabledForegroundColor: HColors.darkGrey,
      disabledBackgroundColor: HColors.buttonDisabled,
      side: const BorderSide(color: HColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.light,
      backgroundColor: HColors.primary,
      disabledForegroundColor: HColors.darkGrey,
      disabledBackgroundColor: HColors.darkerGrey,
      side: const BorderSide(color: HColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );
}
