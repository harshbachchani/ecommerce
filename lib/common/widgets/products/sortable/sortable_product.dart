import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HSortableProducts extends StatelessWidget {
  const HSortableProducts({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
          ].map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),

        const SizedBox(height: HSizes.spaceBtwSections),

        //Products

        Obx(
          () => HGridLayout(
              itemcount: controller.products.length,
              itemBuilder: (_, index) => HProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
