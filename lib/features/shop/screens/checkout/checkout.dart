import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widgets/success_screen/success_screen1.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/all_cart_item.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);

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
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: HImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subtitle: 'Your Item Will Be Shipped Soon!',
                    onpressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Checkout ${HTextString.rupeeSign}256.0')),
      ),
    );
  }
}
