import 'package:datafloat_test/modules/details_screen/binding/details_binding.dart';
import 'package:datafloat_test/modules/details_screen/view/details_screen.dart';
import 'package:datafloat_test/modules/list_screen/binding/list_binding.dart';
import 'package:datafloat_test/modules/list_screen/view/list_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.detailsScreen,
      page: () => DetailsScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.listScreen,
      page: () => ListScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ListBinding(),
    ),
   
  ];
}
