import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HBillingAddressSection extends StatelessWidget {
  const HBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HSectionHeading(
            title: 'Shipping Address',
            buttontitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),
          addressController.selectedAddress.value.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressController.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: HSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.grey, size: 16),
                        const SizedBox(width: HSizes.spaceBtwItems),
                        Text(
                            addressController.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                    const SizedBox(height: HSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: HSizes.spaceBtwItems),
                        SizedBox(
                          width: HHelperFunctions.screenWidth() * 0.6,
                          child: Text(
                              addressController.selectedAddress.value
                                  .toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true),
                        )
                      ],
                    ),
                    const SizedBox(height: HSizes.spaceBtwItems / 2),
                  ],
                )
              : Text('Select Address',
                  style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
