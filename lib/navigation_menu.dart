import 'package:ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce/features/shop/screens/home/home.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          selectedIndex: controller.getindex(),
          elevation: 0,
          backgroundColor: dark ? HColors.black : HColors.white,
          indicatorColor: dark
              ? HColors.white.withOpacity(0.1)
              : HColors.black.withOpacity(0.1),
          onDestinationSelected: (index) => controller.updateindex(index),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Home'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.getindex()]),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  updateindex(i) {
    selectedIndex.value = i;
  }

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
  getindex() {
    return selectedIndex.value;
  }
}
