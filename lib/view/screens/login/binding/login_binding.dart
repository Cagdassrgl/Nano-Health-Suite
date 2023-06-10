import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/core/network/client/login_client.dart';
import 'package:nano_health_suite/view/controller/main_controller.dart';
import 'package:nano_health_suite/view/screens/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();

    Get.lazyPut(() => dio);

    Get.lazyPut(
      () => LoginClient(dio, baseUrl: "https://fakestoreapi.com/"),
    );

    Get.lazyPut(() => MainController());

    Get.lazyPut(
      () => LoginController(
        client: Get.find(),
      ),
    );
  }
}
