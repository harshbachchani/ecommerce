import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: HColors.primary,
        child: const Icon(Iconsax.add, color: HColors.white),
      ),
      appBar: HAppBar(
        showbackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.allUserAddress(),
                builder: (context, snapshot) {
                  final widget = HCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot);
                  if (widget != null) return widget;
                  final addresses = snapshot.data!;
                  return ListView.builder(
                    itemBuilder: (_, index) => HSingleAddress(
                      onTap: () =>
                          controller.selectTappedAddress(addresses[index]),
                      address: addresses[index],
                    ),
                    shrinkWrap: true,
                    itemCount: addresses.length,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
