import 'package:ecommerce/features/shop/screens/product_reviews/widgets/ratingprogressindicator.dart';
import 'package:flutter/material.dart';

class HOverallProductRating extends StatelessWidget {
  const HOverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              HRatingProgressIndicator(text: '5', value: 1.0),
              HRatingProgressIndicator(text: '4', value: 0.8),
              HRatingProgressIndicator(text: '3', value: 0.6),
              HRatingProgressIndicator(text: '2', value: 0.4),
              HRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
