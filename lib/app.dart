import 'package:ecommerce/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:ecommerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: HAppTheme.darkTheme,
      theme: HAppTheme.lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}
