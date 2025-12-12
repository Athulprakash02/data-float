import 'package:datafloat_test/routes/app_pages.dart';
import 'package:datafloat_test/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "DataFloat Test",
        initialRoute: AppRoutes.listScreen,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
       
      );
  }

}