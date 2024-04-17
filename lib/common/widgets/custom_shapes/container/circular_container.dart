import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HCircularContainer extends StatelessWidget {
  const HCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.backgroundColor = HColors.white,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
