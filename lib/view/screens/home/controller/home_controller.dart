// ignore_for_file: unnecessary_overrides, non_constant_identifier_names, constant_identifier_names

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nano_health_suite/core/constants/navigation/app_navigation.dart';
import 'package:nano_health_suite/core/network/client/product_client.dart';
import 'package:nano_health_suite/core/network/model/product/product_model.dart';
import 'package:nano_health_suite/view/controller/main_controller.dart';

class HomeController extends GetxController {
  final ProductClient client;

  HomeController({required this.client});

  late final MainController mainController = Get.find();

  Logger logger = Logger();

  final products = RxList<ProductModel?>();

  ProductsEnum state = ProductsEnum.IDLE;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      final result = await client.getProducts();

      final response = result.data;

      if (response != null && response.isNotEmpty) {
        products.clear();
        products.addAll(response);
        state = ProductsEnum.SUCCESS;
      } else {
        state = ProductsEnum.EMPTY;
      }
      update([PAGE_OBSERVE_ID]);
    } catch (error) {
      state = ProductsEnum.ERROR;
      update([PAGE_OBSERVE_ID]);
      logger.e(error);
    }
  }

  void navigateDetailPage(ProductModel? model) {
    mainController.changeScreen(AppNavigation.DETAIL, arguments: model);
  }

  static String PAGE_OBSERVE_ID = "page_observe_id";
}

enum ProductsEnum {
  SUCCESS,
  ERROR,
  EMPTY,
  IDLE,
}
