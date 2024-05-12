import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/common/widgets/products/products_cards/widgets/product_price_text.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HOrderDetails extends StatelessWidget {
  const HOrderDetails({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(title: Text('Order Details')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: HSectionHeading(
                title: 'Order - ${order.id}', showActionButton: false),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) =>
                  const SizedBox(height: HSizes.spaceBtwSections),
              itemCount: order.items.length,
              itemBuilder: (_, index) {
                final item = order.items[index];
                return Column(
                  children: [
                    HCartItem(item: item),
                    HProductPriceText(price: order.totalAmount.toString())
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
