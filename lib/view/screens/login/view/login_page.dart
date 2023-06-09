import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/assets/app_assets.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTop(),
        buildBottom(),
      ],
    );
  }

  Widget buildBottom() {
    return Expanded(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 54.h, bottom: 110.h, right: 36.w, left: 36.w),
          ),
        ),
      );
  }

  Widget buildTop() {
    return Expanded(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gradientFirst, AppColors.gradientSecond],
                ),
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.LOGIN_PNG,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 30.h, horizontal: 36.w),
                child: Text(
                  "Log In",
                  style: GoogleFonts.openSans(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
