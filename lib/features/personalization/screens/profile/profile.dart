import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const HAppBar(
        showbackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Obx(
            () => Column(
              children: [
                //Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : HImages.user;
                        return controller.imageUploading.value
                            ? const HShimmerEffect(
                                width: 80, height: 80, radius: 80)
                            : HCircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      }),
                      TextButton(
                        onPressed: () => controller.uploadUserProfile(),
                        child: const Text('Change Profile Picture'),
                      ),
                    ],
                  ),
                ),

                //Details
                const SizedBox(height: HSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: HSizes.spaceBtwItems),
                const HSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: HSizes.spaceBtwItems),

                HProfileMenu(
                    onPressed: () => Get.to(() => const ChangeName()),
                    title: 'Name',
                    value: controller.user.value.fullName),
                HProfileMenu(
                    onPressed: () {},
                    title: 'Username',
                    value: controller.user.value.username),
                const SizedBox(height: HSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: HSizes.spaceBtwItems),

                //Heading Personal Info
                const HSectionHeading(
                    title: 'Personal Information', showActionButton: false),
                const SizedBox(height: HSizes.spaceBtwItems),

                HProfileMenu(
                    onPressed: () {},
                    title: 'User_Id',
                    value: controller.user.value.id,
                    icon: Iconsax.copy),
                HProfileMenu(
                    onPressed: () {},
                    title: 'E-mail',
                    value: controller.user.value.email),
                HProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.user.value.phonenumber),
                HProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
                HProfileMenu(
                    onPressed: () {},
                    title: 'Date Of Birth',
                    value: '10 Oct ,1999'),
                const Divider(),
                const SizedBox(height: HSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    ),
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
