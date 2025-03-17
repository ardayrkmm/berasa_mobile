import 'package:get/get.dart';

import '../controllers/verifikasi_ubah_password_controller.dart';

class VerifikasiUbahPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiUbahPasswordController>(
      () => VerifikasiUbahPasswordController(),
    );
  }
}
