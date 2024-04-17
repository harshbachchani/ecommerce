import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HRoundedContainer extends StatelessWidget {
  const HRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = HSizes.cardRadiusLg,
    this.padding,
    this.margin,
    this.backgroundColor = HColors.white,
    this.showborder = false,
    this.borderColor = HColors.borderPrimary,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color borderColor;
  final Color? backgroundColor;
  final bool showborder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showborder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
