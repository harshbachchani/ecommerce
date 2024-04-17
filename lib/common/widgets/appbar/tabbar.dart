import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HTabBar extends StatelessWidget implements PreferredSize {
  //If you want to add the background color to tabs then you have
  // to wrap them in Material Widget.
  // To do that we need [PreferredSize] Widget and that's why
  //created custom class
  const HTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? HColors.black : HColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: HColors.primary,
        labelColor: dark ? HColors.white : HColors.primary,
        unselectedLabelColor: HColors.darkGrey,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
