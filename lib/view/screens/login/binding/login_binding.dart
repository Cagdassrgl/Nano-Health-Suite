import 'package:get/get.dart';
import 'package:nano_health_suite/view/controller/main_controller.dart';
import 'package:nano_health_suite/view/screens/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => MainController());

    Get.lazyPut(() => LoginController());
  }

}