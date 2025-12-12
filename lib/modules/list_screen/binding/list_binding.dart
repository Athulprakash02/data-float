import 'package:datafloat_test/modules/list_screen/controller/list_controller.dart';
import 'package:get/get.dart';

class ListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController());
  }
}
