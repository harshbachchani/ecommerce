import 'package:ecommerce/common/widgets/listtile/payment_tile.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/models/payment_method_model.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: HImages.paypal, name: 'PayPal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(HSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HSectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwSections),
              HPaymentTile(
                paymentMethod:
                    PaymentMethodModel(image: HImages.paypal, name: 'PayPal'),
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: HImages.googlePay, name: 'Google Pay'),
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                paymentMethod:
                    PaymentMethodModel(image: HImages.paytm, name: 'Paytm'),
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: HImages.masterCard, name: 'Master Card'),
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: HImages.applePay, name: 'Apple Pay'),
              ),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              const SizedBox(height: HSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
