import 'package:ecommerce/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HSingleAddress extends StatelessWidget {
  const HSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return HRoundedContainer(
      width: double.infinity,
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
                'Harry Broker',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: HSizes.sm / 2),
              const Text('9044123548',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: HSizes.sm / 2),
              const Text('452 Mall Road,South Plaza,Main Road,Delhi',
                  softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
