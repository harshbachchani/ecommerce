import 'package:ecommerce/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/text_theme.dart';
import 'package:ecommerce/utils/theme/custom_themes/textfield_theme.dart';
import 'package:flutter/material.dart';

class HAppTheme {
  HAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    chipTheme: HChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: HTextTheme.lightTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HOutlineButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: HCheckBoxTheme.lightCheckboxTheme,
    inputDecorationTheme: HTextFieldTheme.lightInputDecorationTheme,
    appBarTheme: HAppBarTheme.lightAppbarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    chipTheme: HChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: HTextTheme.darkTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: HOutlineButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: HCheckBoxTheme.darkCheckboxTheme,
    inputDecorationTheme: HTextFieldTheme.darkInputDecorationTheme,
    appBarTheme: HAppBarTheme.darkAppbarTheme,
  );
}
