import 'package:ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HHelperFunctions.isDarkMode(Get.context!)
              ? HColors.dark
              : HColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              HAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
