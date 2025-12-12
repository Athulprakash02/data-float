import 'dart:convert';
import 'dart:developer';

import 'package:datafloat_test/data/models/house_data_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ListController extends GetxController {
  var isLoading = false.obs;
  var houseList = <HouseData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHouseData();
  }

  Future loadHouseData() async {
    isLoading.value = true;
    final String response = await rootBundle.loadString('assets/data/listings.json');

    final Map<String, dynamic> data = jsonDecode(response);

    final houseDataModel = HouseDataModel.fromJson(data);
    houseList.value = houseDataModel.data!;
    log(houseList.length.toString());
    isLoading.value = false;
  }
}
