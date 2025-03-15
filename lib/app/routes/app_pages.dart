import 'package:berasa_mobile/app/modules/splash/views/splash_page_1_view.dart';
import 'package:berasa_mobile/app/modules/splash/views/splash_page_2.dart';
import 'package:berasa_mobile/app/modules/splash/views/splash_page_3.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const SplashView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH1,
      page: () => const SplashPage1View(),
      binding: SplashBinding(),
    ),
    GetPage(name: _Paths.SPLASH2, page: () => const SplashPage2View()),
    GetPage(name: _Paths.SPLASH3, page: () => const SplashPage3View()),
  ];
}
