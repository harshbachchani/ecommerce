import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/reauthenticate_user.dart';

import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final userrepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //Refresh User Record
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameparts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          //Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameparts[0],
            lastName: nameparts.length > 1 ? nameparts.sublist(1).join() : '',
            email: userCredential.user!.email ?? '',
            username: username,
            phonenumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          //save user data
          await userrepository.saveuserRecord(user);
        }
      }
    } catch (e) {
      HLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userrepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      HLoaders.errorSnackBar(title: 'Cannot get user details');
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(HSizes.md),
      title: 'Delete Account',
      middleText:
          'Are You sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: HSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      HFullScreenLoader.openLoadingDialog('Processing', HImages.doceranimation);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Reverify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          HFullScreenLoader.stoploading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          HFullScreenLoader.stoploading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      HFullScreenLoader.stoploading();
      HLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  //Reauthenticate Before deleting
  Future<void> reauthenticateEmailandPassword() async {
    try {
      HFullScreenLoader.openLoadingDialog('Processing', HImages.doceranimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        HFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      HFullScreenLoader.stoploading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      HFullScreenLoader.stoploading();
    }
  }

  Future<void> uploadUserProfile() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userrepository.uploadImage('Users/Images/Profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userrepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        HLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!!');
      }
    } catch (e) {
      HLoaders.errorSnackBar(
          title: 'Oh Snap!!', message: 'Something Went Wrong');
    } finally {
      imageUploading.value = false;
    }
  }
}
