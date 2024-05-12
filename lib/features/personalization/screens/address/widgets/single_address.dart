import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/features/personalization/models/address_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HSingleAddress extends StatelessWidget {
  const HSingleAddress({
    super.key,
    required this.onTap,
    required this.address,
  });
  final VoidCallback onTap;
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedaddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedaddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: HRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              vertical: HSizes.sm, horizontal: HSizes.md),
          showborder: true,
          backgroundColor: selectedAddress
              ? HColors.primary.withOpacity(.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? HColors.darkerGrey
                  : HColors.grey,
          margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle : null,
                  color: selectedAddress
                      ? dark
                          ? HColors.light
                          : HColors.dark.withOpacity(0.6)
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: HSizes.sm / 2),
                  Text(address.phoneNumber,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: HSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
