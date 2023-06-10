import 'package:get/get.dart';
import 'package:nano_health_suite/core/constants/navigation/app_navigation.dart';

class MainController extends GetxController {
  String currentPage = AppNavigation.LOGIN;

  void changeScreen(String page, {dynamic arguments}) {
    currentPage = page;

    if (page == AppNavigation.LOGIN) {
      Get.offAllNamed(page,
          arguments: arguments, id: AppNavigation.APP_NESTED_KEY);
    } else {
      Get.toNamed(page, arguments: arguments, id: AppNavigation.APP_NESTED_KEY);
    }
  }
}
