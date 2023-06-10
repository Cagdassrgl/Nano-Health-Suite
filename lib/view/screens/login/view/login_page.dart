import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_health_suite/core/constants/assets/app_assets.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';
import 'package:nano_health_suite/view/components/login/login_button.dart';
import 'package:nano_health_suite/view/components/login/login_text_form_field.dart';
import 'package:nano_health_suite/view/screens/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late final LoginController controller = Get.find();

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
      child: Padding(
        padding: EdgeInsets.only(top: 54.h, right: 36.w, left: 36.w),
        child: Column(
          children: [
            LoginTextFormField(
              iconData: Icons.check_circle_outline,
              controller: controller.usernameController,
              color: AppColors.iconCheckColor,
              labelText: 'Email',
            ),
            SizedBox(height: 32.sp),
            LoginTextFormField(
              iconData: Icons.remove_red_eye_outlined,
              controller: controller.passwordController,
              color: AppColors.black.withOpacity(.15),
              labelText: 'Password',
            ),
            SizedBox(height: 24.sp),
            LoginButton(
              onTap: () {
                controller.onTapLogin();
              },
            ),
            SizedBox(height: 43.h),
            Text(
              "NEED HELP?",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black.withOpacity(.65),
                fontFamily: "SFProDisplay"
              ),
            ),
          ],
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
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 36.w),
              child: Text(
                "Log In",
                style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    fontFamily: "SFProDisplay"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
