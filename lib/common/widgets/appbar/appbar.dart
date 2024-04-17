import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar({
    super.key,
    this.title,
    this.showbackArrow = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnpressed,
  });
  final Widget? title;
  final bool showbackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showbackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  CupertinoIcons.back,
                  color: HHelperFunctions.isDarkMode(context)
                      ? HColors.light
                      : HColors.dark,
                ),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnpressed,
                    icon: Icon(
                      leadingIcon,
                      color: HHelperFunctions.isDarkMode(context)
                          ? HColors.light
                          : HColors.dark,
                    ),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
