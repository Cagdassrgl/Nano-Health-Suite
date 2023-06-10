// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health_suite/core/constants/colors/app_colors..dart';

class LoginTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? labelText;
  IconData? iconData;
  Color? color;
  bool obscureText;
  final Function()? onTap;

  LoginTextFormField({
    Key? key,
    required this.iconData,
    required this.controller,
    required this.color,
    required this.labelText,
    this.onTap,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.85),
            fontFamily: "SFProDisplay"),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
            color: color,
          ),
        ),
      ),
    );
  }
}
