import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/core/network/client/product_client.dart';
import 'package:nano_health_suite/view/controller/main_controller.dart';
import 'package:nano_health_suite/view/screens/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();

    Get.lazyPut(() => dio);

    Get.lazyPut(
      () => ProductClient(
        Get.find(),
        baseUrl: "https://fakestoreapi.com/",
      ),
    );

    Get.lazyPut(
      () => MainController(),
    );

    Get.lazyPut(
      () => HomeController(
        client: Get.find(),
      ),
    );
  }
}
