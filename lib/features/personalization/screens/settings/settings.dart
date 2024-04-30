import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/container/primaryheadercontainer.dart';
import 'package:ecommerce/common/widgets/listtile/setting_menu.dart';
import 'package:ecommerce/common/widgets/listtile/user_profile_tile.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';

import 'package:ecommerce/data/repositories/products/product_repository.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/features/shop/screens/cart/cart.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/dummy_data.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  HAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: HColors.white,
                          ),
                    ),
                  ),

                  //User Profile Card
                  HUserProfileTile(
                    onPressed: () {
                      Get.to(() => const ProfileScreen());
                    },
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                ],
              ),
            ),
            //Body

            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  const HSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  HSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add,remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-Progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'set any kind of notification messages',
                    onTap: () {},
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data Usage and connected accounts',
                    onTap: () {},
                  ),

                  ///App Settings
                  const SizedBox(height: HSizes.spaceBtwSections),
                  const HSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  HSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load data',
                    subtitle: 'upload data in your cloud Firebase',
                    onTap: () async {
                      ProductRepository.instance
                          .uploadDummyData(HDummyData.products);
                    },
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geo Location',
                    subtitle: 'Get Recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  HSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Quality Image',
                    subtitle: 'Set Image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
