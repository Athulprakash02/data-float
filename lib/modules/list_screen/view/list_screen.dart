import 'package:datafloat_test/constants/app_strings.dart';
import 'package:datafloat_test/modules/list_screen/controller/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final ListController listCotroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.listings),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(listCotroller.houseList[index].iDCPROPERTYTYPE!),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: listCotroller.houseList.length,
        ),
      ),
    );
  }
}
