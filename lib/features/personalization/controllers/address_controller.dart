import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/data/repositories/address/address_repository.dart';
import 'package:ecommerce/data/services/network_manager.dart';
import 'package:ecommerce/features/personalization/models/address_model.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:ecommerce/utils/popups/full_screen_loaders.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  RxBool refreshData = true.obs;
  GlobalKey<FormState> addressFormkey = GlobalKey<FormState>();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
      return [];
    }
  }

  Future<void> addnewAddress() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'Storing Address...', HImages.doceranimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stoploading();
        return;
      }
      if (!addressFormkey.currentState!.validate()) {
        HFullScreenLoader.stoploading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);
      address.id = id;
      await selectTappedAddress(address);
      HFullScreenLoader.stoploading();

      HLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');
      refreshData.toggle();
      resetFormFields();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
      HFullScreenLoader.stoploading();
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(HSizes.lg),
        child: Column(
          children: [
            const HSectionHeading(
                title: 'Select Address', showActionButton: false),
            FutureBuilder(
              future: allUserAddress(),
              builder: (_, snapshot) {
                final response = HCloudHelperFunction.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;
                final mydata = snapshot.data!;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: mydata.length,
                    itemBuilder: (_, index) => HSingleAddress(
                        onTap: () async {
                          await selectTappedAddress(mydata[index]);
                          Get.back();
                        },
                        address: mydata[index]));
              },
            ),
            const SizedBox(height: HSizes.defaultSpace * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const AddNewAddressScreen()),
                child: const Text('Add new address'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> selectTappedAddress(AddressModel newselectedaddress) async {
    try {
      // clear the selected field
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      newselectedaddress.selectedAddress = true;
      selectedAddress.value = newselectedaddress;
      await addressRepository.updateSelectedField(newselectedaddress.id, true);
      Get.back();
    } catch (e) {
      HLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormkey.currentState?.reset();
  }
}
