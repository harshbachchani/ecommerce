import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/validators/validaton.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const HAppBar(showbackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
            key: controller.addressFormkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      HValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => HValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.mobile)),
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            HValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                            labelText: 'Street',
                            prefixIcon: Icon(Iconsax.building_3)),
                      ),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            HValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                            labelText: 'Postal Code',
                            prefixIcon: Icon(Iconsax.code)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            HValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                            labelText: 'City',
                            prefixIcon: Icon(Iconsax.building)),
                      ),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            HValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                            labelText: 'State',
                            prefixIcon: Icon(Iconsax.activity)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      HValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
                const SizedBox(height: HSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addnewAddress(),
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
