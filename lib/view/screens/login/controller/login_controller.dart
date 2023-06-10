// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nano_health_suite/core/constants/navigation/app_navigation.dart';
import 'package:nano_health_suite/core/network/client/login_client.dart';
import 'package:nano_health_suite/core/network/model/login/login_model.dart';
import 'package:nano_health_suite/view/components/login/login_loading_dialog.dart';
import 'package:nano_health_suite/view/controller/main_controller.dart';

class LoginController extends GetxController {
  final LoginClient client;

  LoginController({required this.client});

  Logger logger = Logger();

  LoginModel? loginModel;

  bool isObscure = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final MainController mainController = Get.find();

  Future<void> postLogin() async {
    try {
      final response = await client.postLogin("auth/login",params: {
        "username": usernameController.text,
        "password": passwordController.text,
      });

      if (response != null) {
        loginModel = null;
        loginModel = response;
      }
    } catch (error) {
      logger.e(error);
    }
  }

  void onTapLogin() async {
    Get.dialog(
      const LoginLoadingDialog(),
    );
    await postLogin();

    if (loginModel != null) {
      Get.back();
      mainController.changeScreen(AppNavigation.HOME);
    }else {
      Get.back();
    }
  }

  void onTapPasswordIcon() {
   isObscure = isObscure ? false : true;
   update([PAGE_OBSERVE_ID]);
  }

  static const PAGE_OBSERVE_ID = "observe_id";
}
