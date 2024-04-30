import 'package:ecommerce/bindings/general_bindings.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/colors.dart';
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
      getPages: AppRoutes.pages,
      darkTheme: HAppTheme.darkTheme,
      theme: HAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: HColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: HColors.white,
          ),
        ),
      ),
    );
  }
}
