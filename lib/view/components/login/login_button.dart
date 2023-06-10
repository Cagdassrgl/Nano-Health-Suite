// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;

  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 74.h,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(62.r),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              fontFamily: "SFProDisplay"
            ),
          ),
        ),
      ),
    );
  }
}
