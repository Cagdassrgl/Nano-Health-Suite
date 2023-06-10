// ignore_for_file: avoid_types_as_parameter_names

import 'package:dio/dio.dart';
import 'package:nano_health_suite/core/network/model/login/login_model.dart';

class LoginClient {

  Dio dio;
  String? baseUrl;

  LoginClient(this.dio, {this.baseUrl});

  Future<LoginModel?> postLogin(String path, {Map<String, dynamic>? params}) async  {

    final result = await dio.post<Map<String, dynamic>>("$baseUrl$path", data: params);

    final response = result.data;

    return LoginModel.fromJson(response!);

  }
}