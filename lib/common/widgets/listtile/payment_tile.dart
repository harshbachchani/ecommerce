import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/features/shop/models/payment_method_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HPaymentTile extends StatelessWidget {
  const HPaymentTile({
    super.key,
    required this.paymentMethod,
  });
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: HRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: HHelperFunctions.isDarkMode(context)
            ? HColors.light
            : HColors.white,
        padding: const EdgeInsets.all(HSizes.sm),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_3),
    );
  }
}
