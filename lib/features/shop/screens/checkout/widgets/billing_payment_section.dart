import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HBillingPaymentSection extends StatelessWidget {
  const HBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HSectionHeading(
          title: 'Payment Method',
          buttontitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              HRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? HColors.light : HColors.white,
                padding: const EdgeInsets.all(HSizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: HSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
