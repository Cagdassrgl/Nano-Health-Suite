// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';
import 'package:nano_health_suite/core/constants/navigation/app_navigation.dart';
import 'package:nano_health_suite/view/components/home/home_product_star.dart';
import 'package:nano_health_suite/view/screens/detail/controller/detail_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  late final DetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: DetailController.PAGE_OBSERVE_ID,
      init: controller,
      builder: (context) {
        return Stack(
          children: [
            Image.network(
              controller.product?.image ?? "",
              width: double.maxFinite,
              height: 630.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back(id: AppNavigation.APP_NESTED_KEY);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                              spreadRadius: 1.0.r,
                              blurRadius: 20.0.r,
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.appbarColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Detail",
                      style: GoogleFonts.openSans(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          backgroundColor: AppColors.black.withOpacity(.1)),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        spreadRadius: 1.0.r,
                        blurRadius: 20.0.r,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColors.appbarColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: controller.isMore ? 360.h : 240.h,
              left: 20.w,
              child: Text(
                "${controller.product?.price ?? 0} AED",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                  color: AppColors.appbarColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: controller.isMore ? 360.h : 240.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      spreadRadius: 1.0.r,
                      blurRadius: 20.0.r,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: controller.onTapIsMore,
                        child: Center(
                          child: Icon(
                            controller.isMore
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(107, 127, 153, .25),
                                  spreadRadius: 1.0.r,
                                  blurRadius: 20.0.r,
                                )
                              ],
                            ),
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: AppColors.buttonColor,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Container(
                            width: 280.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(43.sp),
                            ),
                            child: Center(
                              child: Text(
                                "Order Now",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Text(
                          "Description",
                          style: GoogleFonts.openSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF444B51),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Text(
                          controller.product?.description ?? "",
                          style: GoogleFonts.openSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF444B51),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.isMore,
                        child: SizedBox(height: 20.h),
                      ),
                      Visibility(
                        visible: controller.isMore,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0.w, vertical: 8.h),
                          height: 100.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reviews (${controller.product?.rating.count ?? 0})",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: Color(0xFF444B51),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.0.w,
                                    vertical: 5.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${controller.product?.rating.rate ?? 0.0}",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32.sp,
                                          color: AppColors.black,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(width: 50.w),
                                      Row(
                                        children: [
                                          ColoredStar(size: 25, colorRatio: (controller.product?.rating.rate ?? 0.0) >= 1 ? 1 : (controller.product?.rating.rate ?? 0.0)),
                                          ColoredStar(size: 25, colorRatio: (controller.product?.rating.rate ?? 0.0) >= 2 ? 1 : (controller.product?.rating.rate ?? 0.0)- 1),
                                          ColoredStar(size: 25, colorRatio: (controller.product?.rating.rate ?? 0.0) >= 3 ? 1: (controller.product?.rating.rate ?? 0.0)- 2),
                                          ColoredStar(size: 25, colorRatio: (controller.product?.rating.rate ?? 0.0) >= 4 ? 1: (controller.product?.rating.rate ?? 0.0) - 3),
                                          ColoredStar(size: 25, colorRatio: (controller.product?.rating.rate ?? 0.0) >= 5 ? 1: (controller.product?.rating.rate ?? 0.0)- 4),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
