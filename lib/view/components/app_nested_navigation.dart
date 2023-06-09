import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/core/constants/navigation/app_navigation.dart';
import 'package:nano_health_suite/view/screens/detail/binding/detail_binding.dart';
import 'package:nano_health_suite/view/screens/detail/view/detail_page.dart';
import 'package:nano_health_suite/view/screens/home/view/home_view.dart';
import 'package:nano_health_suite/view/screens/login/binding/login_binding.dart';
import 'package:nano_health_suite/view/screens/login/view/login_page.dart';

import '../screens/home/binding/home_binding.dart';

class AppNestedNavigation extends StatelessWidget {
  const AppNestedNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Navigator(
        key: Get.nestedKey(AppNavigation.APP_NESTED_KEY),
        initialRoute: AppNavigation.LOGIN,
        observers: [GetObserver((_) {}, Get.routing)],
        onGenerateRoute: (settings) {
          final routes = <String, GetPageRoute>{
            AppNavigation.LOGIN: GetPageRoute(
              settings: settings,
              routeName: AppNavigation.LOGIN,
              page: () => const LoginPage(),
              binding: LoginBinding(),
            ),
            AppNavigation.HOME: GetPageRoute(
              settings: settings,
              routeName: AppNavigation.HOME,
              page: () => const HomePage(),
              binding: HomeBinding(),
            ),
            AppNavigation.DETAIL: GetPageRoute(
              settings: settings,
              routeName: AppNavigation.DETAIL,
              page: () => const DetailPage(),
              binding: DetailBinding(),
            ),
          };
          return routes[settings.name] ??
              GetPageRoute(
                settings: settings,
                routeName: AppNavigation.LOGIN,
                page: () => const LoginPage(),
                binding: LoginBinding(),
              );
        },
      ),
    );
  }
}
