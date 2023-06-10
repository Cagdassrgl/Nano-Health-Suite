import 'package:get/get.dart';
import 'package:nano_health_suite/view/screens/detail/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailController(),
    );
  }
}
