import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/view/components/app_nested_navigation.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (BuildContext context, Widget? child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AppNestedNavigation(),
        ),
      ),
    );
  }
}
