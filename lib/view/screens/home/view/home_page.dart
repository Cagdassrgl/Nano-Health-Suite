import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/view/screens/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.products.length,
        itemBuilder: (context, index) {

          final product = controller.products[index];
          return Text(product?.title ?? "");
        },
      ),
    );
  }
}
