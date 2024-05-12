import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HCircularLoader extends StatelessWidget {
  const HCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: HColors.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const CircularProgressIndicator(),
    );
  }
}
