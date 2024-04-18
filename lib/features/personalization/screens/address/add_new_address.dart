import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(showbackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.mobile)),
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Street',
                            prefixIcon: Icon(Iconsax.building_3)),
                      ),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
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
                        decoration: const InputDecoration(
                            labelText: 'City',
                            prefixIcon: Icon(Iconsax.building)),
                      ),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'State',
                            prefixIcon: Icon(Iconsax.activity)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
                const SizedBox(height: HSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
