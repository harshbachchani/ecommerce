import 'package:flutter/material.dart';

class HProductPriceText extends StatelessWidget {
  const HProductPriceText({
    super.key,
    this.currencySign = '₹',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.linethrough = false,
  });
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null),
    );
  }
}
