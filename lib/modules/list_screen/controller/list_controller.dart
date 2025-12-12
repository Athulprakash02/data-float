import 'dart:convert';
import 'dart:developer';

import 'package:datafloat_test/data/models/house_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ListController extends GetxController {
  var isLoading = false.obs;
  var isSearching = false.obs;
  var houseList = <HouseData>[].obs;
  var searchedHouseList = <HouseData>[].obs;
  var searchTextController = TextEditingController();

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
    searchedHouseList.value = houseList;
    log(houseList.length.toString());
    isLoading.value = false;
  }




   void searchByAddress(String? rawQuery) {
    final query = (rawQuery ?? '').trim();

    if (query.isEmpty) {
      // reset to full list
      searchedHouseList.value = List<HouseData>.from(houseList);
      return;
    }

    // split into words and remove empty tokens
    final words = query
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    final filtered = houseList.where((house) {
      final address = (house.iDCFULLADDRESS ?? '').toLowerCase();

      for (final w in words) {
        if (!address.contains(w)) return false;
      }
      return true;
    }).toList();

    searchedHouseList.value = filtered;
  }
}
