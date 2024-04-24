import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HAnimationLoaderWidget extends StatelessWidget {
  const HAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showaction = false,
    this.actiontext,
    this.onactionPressed,
  });

  final String text;
  final String animation;
  final bool showaction;
  final String? actiontext;
  final VoidCallback? onactionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width: HHelperFunctions.screenWidth() * 0.8),
          const SizedBox(height: HSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HSizes.defaultSpace),
          showaction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onactionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: HColors.dark),
                    child: Text(
                      actiontext!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: HColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
