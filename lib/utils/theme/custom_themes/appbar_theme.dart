import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HAppBarTheme {
  HAppBarTheme._();

  static const lightAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HColors.black, size: HSizes.iconMd),
    actionsIconTheme: IconThemeData(color: HColors.black, size: HSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: HColors.black),
  );
  static const darkAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HColors.black, size: HSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.black, size: HSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: HColors.white),
  );
}
