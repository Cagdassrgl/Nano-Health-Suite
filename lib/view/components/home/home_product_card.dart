// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';
import 'package:nano_health_suite/core/network/model/product/product_model.dart';

import 'home_product_star.dart';

class HomeProductCard extends StatelessWidget {
  final Function()? onTap;
  ProductModel? model;

  HomeProductCard({Key? key, required this.model, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0.h),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 26.w),
          width: 362.w,
          height: 309.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    model?.image ?? "",
                    width: 362.w,
                    height: 216.h,
                  ),
                  Positioned(
                    bottom: 10.h,
                    left: 10.w,
                    child: Text(
                      "${model?.price ?? 0} AED",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        color: AppColors.appbarColor,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10.h,
                      right: 20.w,
                      child: Row(
                        children: [
                          ColoredStar(
                              size: 25,
                              colorRatio: (model?.rating.rate ?? 0.0) >= 1
                                  ? 1
                                  : (model?.rating.rate ?? 0.0)),
                          ColoredStar(
                              size: 25,
                              colorRatio: (model?.rating.rate ?? 0.0) >= 2
                                  ? 1
                                  : (model?.rating.rate ?? 0.0) - 1),
                          ColoredStar(
                              size: 25,
                              colorRatio: (model?.rating.rate ?? 0.0) >= 3
                                  ? 1
                                  : (model?.rating.rate ?? 0.0) - 2),
                          ColoredStar(
                              size: 25,
                              colorRatio: (model?.rating.rate ?? 0.0) >= 4
                                  ? 1
                                  : (model?.rating.rate ?? 0.0) - 3),
                          ColoredStar(
                              size: 25,
                              colorRatio: (model?.rating.rate ?? 0.0) >= 5
                                  ? 1
                                  : (model?.rating.rate ?? 0.0) - 4),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Text(
                  "product name",
                  style: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF444B51),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Text(
                  model?.title ?? "",
                  style: GoogleFonts.openSans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.appbarColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
