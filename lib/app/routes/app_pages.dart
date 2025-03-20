import 'package:berasa_mobile/app/modules/detailProfil/views/detail_profil_view.dart';
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
import '../modules/ubahpassword_email/bindings/ubahpassword_email_binding.dart';
import '../modules/ubahpassword_email/views/ubahpassword_email_view.dart';
import '../modules/ubahpassword_passwordbaru/bindings/ubahpassword_passwordbaru_binding.dart';
import '../modules/ubahpassword_passwordbaru/views/ubahpassword_passwordbaru_view.dart';
import '../modules/verifikasi_email/bindings/verifikasi_email_binding.dart';
import '../modules/verifikasi_email/views/verifikasi_email_view.dart';
import '../modules/verifikasi_ubah_password/bindings/verifikasi_ubah_password_binding.dart';
import '../modules/verifikasi_ubah_password/views/verifikasi_ubah_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
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
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
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

    GetPage(
      name: _Paths.VERIFIKASI_EMAIL,
      page: () => VerifikasiEmailView(),
      binding: VerifikasiEmailBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI_UBAH_PASSWORD,
      page: () => VerifikasiUbahPasswordView(),
      binding: VerifikasiUbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.UBAHPASSWORD_EMAIL,
      page: () => const UbahpasswordEmailView(),
      binding: UbahpasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.UBAHPASSWORD_PASSWORDBARU,
      page: () => const UbahpasswordPasswordbaruView(),
      binding: UbahpasswordPasswordbaruBinding(),
    ),
  ];
}
