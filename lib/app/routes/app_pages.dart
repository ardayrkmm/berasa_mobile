import 'package:get/get.dart';

import '../modules/berhasilDonasi/bindings/berhasil_donasi_binding.dart';
import '../modules/berhasilDonasi/views/berhasil_donasi_view.dart';
import '../modules/detailAcara/bindings/detail_acara_binding.dart';
import '../modules/detailAcara/views/detail_acara_view.dart';
import '../modules/formDonasi/bindings/form_donasi_binding.dart';
import '../modules/formDonasi/views/form_donasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/Loading.dart';
import '../modules/splash/views/splash_page_1_view.dart';
import '../modules/splash/views/splash_page_2.dart';
import '../modules/splash/views/splash_page_3.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const LoginView(),
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
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ACARA,
      page: () => const DetailAcaraView(),
      binding: DetailAcaraBinding(),
    ),
    GetPage(
      name: _Paths.BERHASIL_DONASI,
      page: () => const BerhasilDonasiView(),
      binding: BerhasilDonasiBinding(),
    ),
    GetPage(
      name: _Paths.FORM_DONASI,
      page: () => const FormDonasiView(),
      binding: FormDonasiBinding(),
    ),
  ];
}
