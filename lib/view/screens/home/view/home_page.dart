import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';
import 'package:nano_health_suite/view/components/home/home_product_card.dart';
import 'package:nano_health_suite/view/screens/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: HomeController.PAGE_OBSERVE_ID,
      init: controller,
      builder: (context) {
        switch (controller.state) {
          case ProductsEnum.SUCCESS:
            return buildSuccess();
          case ProductsEnum.ERROR:
            return buildError();
          case ProductsEnum.EMPTY:
            return buildEmpty();
          case ProductsEnum.IDLE:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget buildSuccess() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildSuccessTop(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return HomeProductCard(
                model: product,
                onTap: () {
                  controller.navigateDetailPage(product);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildSuccessTop() {
    return Container(
      padding: EdgeInsets.only(top: 47.h),
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            spreadRadius: 1.0.r,
            blurRadius: 20.0.r,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
      ),
      child: Center(
        child: Text(
          "All Products",
          style: GoogleFonts.openSans(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.appbarColor,
          ),
        ),
      ),
    );
  }

  Widget buildEmpty() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 1.0.r,
            blurRadius: 20.0.r,
          ),
        ],
      ),
      child: Text(
        "No content",
        style: TextStyle(
          fontFamily: "SFProDisplay",
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildError() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 1.0.r,
            blurRadius: 20.0.r,
          ),
        ],
      ),
      child: Text(
        "No Error",
        style: TextStyle(
          fontFamily: "SFProDisplay",
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
