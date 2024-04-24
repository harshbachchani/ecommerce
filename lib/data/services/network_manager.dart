// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//manages the network connectivity status and provides methods to check and handle connectivity changes.

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitysubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  //initializes the network manager and set up a stream to cotinually check the connnection status
  @override
  void onInit() {
    super.onInit();
    _connectivitysubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectivitystatus);
  }

  //update the connection status based on changes in connectivity and show a relevant popup
  // for no internet connection

  void _updateConnectivitystatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      HLoaders.warningSnackBar(title: 'No Internet Connection');
      _connectivityStatus.value = ConnectivityResult.none;
    } else {
      if (result.contains(ConnectivityResult.wifi)) {
        _connectivityStatus.value = ConnectivityResult.wifi;
      } else {
        _connectivityStatus.value = ConnectivityResult.mobile;
      }
    }
  }

  //check the internet connection status.
  //Returns true if conencted false otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (ConnectivityResult.none == result) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitysubscription.cancel();
    super.onClose();
  }
}
