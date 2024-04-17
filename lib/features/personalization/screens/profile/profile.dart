import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        showbackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const HCircularImage(
                        image: HImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
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
                  onPressed: () {}, title: 'Name', value: 'Hello User'),
              HProfileMenu(
                  onPressed: () {}, title: 'Username', value: 'hello_user'),
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
                  value: '4589112',
                  icon: Iconsax.copy),
              HProfileMenu(
                  onPressed: () {}, title: 'E-mail', value: 'user@gmail.com'),
              HProfileMenu(
                  onPressed: () {}, title: 'Phone Number', value: '9800764522'),
              HProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              HProfileMenu(
                  onPressed: () {},
                  title: 'Date Of Birth',
                  value: '10 Oct ,1999'),
              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
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
    );
  }
}
