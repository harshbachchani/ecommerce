import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HChipTheme {
  HChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: HColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: HColors.black),
    selectedColor: HColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: HColors.darkerGrey,
    labelStyle: TextStyle(color: HColors.white),
    selectedColor: HColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HColors.white,
  );
}
