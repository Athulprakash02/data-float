import 'package:datafloat_test/data/models/house_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var houseDetails = HouseData().obs;
 
  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    houseDetails.value = Get.arguments;
  }
}