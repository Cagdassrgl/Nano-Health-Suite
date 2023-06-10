// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:nano_health_suite/core/network/model/product/product_model.dart';

class DetailController extends GetxController {
  final arguments = Get.arguments;

  ProductModel? product;

  bool isMore = false;

  @override
  void onInit() {
    if (arguments is ProductModel) {
      product = arguments;
    }
    super.onInit();
  }

  void onTapIsMore() {
    isMore = isMore ? false : true;
    update([PAGE_OBSERVE_ID]);
  }

  static const PAGE_OBSERVE_ID = "page_observe_id";
}
