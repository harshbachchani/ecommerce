import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/all_cart_item.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:ecommerce/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = OrderController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = HPricingCalculator.calculateTotalPrice(subTotal, 'IN');
    return Scaffold(
      appBar: HAppBar(
        showbackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Items In Cart
              const HCartItems(showaddremovebuttons: false),
              const SizedBox(height: HSizes.spaceBtwSections),

              //Coupon TextField
              const HCouponCode(),
              const SizedBox(height: HSizes.spaceBtwSections),

              //Billing Section
              HRoundedContainer(
                showborder: true,
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: dark ? HColors.black : HColors.white,
                child: const Column(
                  children: [
                    //Pricing
                    HBillingAmountSection(),
                    SizedBox(height: HSizes.spaceBtwItems),

                    //Divider
                    Divider(),
                    SizedBox(height: HSizes.spaceBtwItems),
                    //Payment Methods
                    HBillingPaymentSection(),
                    SizedBox(height: HSizes.spaceBtwItems),

                    //Address Section
                    HBillingAddressSection(),
                    //Address
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => HLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add Items to the Cart in order to proceed'),
            child: Text('Checkout ${HTextString.rupeeSign}$totalAmount')),
      ),
    );
  }
}
