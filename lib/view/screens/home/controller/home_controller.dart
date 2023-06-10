// ignore_for_file: unnecessary_overrides, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nano_health_suite/core/network/client/product_client.dart';
import 'package:nano_health_suite/core/network/model/product/product_model.dart';

class HomeController extends GetxController {
  final ProductClient client;

  HomeController({required this.client});

  Logger logger = Logger();

  final products = RxList<ProductModel?>();

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
      }
    } catch (error) {
      logger.e(error);
    }
  }

  static String PAGE_OBSERVE_ID = "page_observe_id";
}
