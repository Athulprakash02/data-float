import 'package:datafloat_test/modules/details_screen/controller/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
