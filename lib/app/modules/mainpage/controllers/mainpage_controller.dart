import 'package:berasa_mobile/app/modules/donasi/controllers/donasi_controller.dart';
import 'package:berasa_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:berasa_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:berasa_mobile/app/modules/profil/controllers/profil_controller.dart';
import 'package:berasa_mobile/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:get/get.dart';

class MainpageController extends GetxController {
  //TODO: Implement MainpageController

  RxInt angka = 0.obs;
  @override
  void onInit() {
    super.onInit();

    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DonasiController>(() => DonasiController(), fenix: true);
    Get.lazyPut<RiwayatController>(() => RiwayatController(), fenix: true);
    Get.lazyPut<ProfilController>(() => ProfilController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void diPilih(int index) {
    angka.value = index;
  }
}
