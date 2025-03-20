import 'package:get/get.dart';

import '../controllers/verifikasi_email_controller.dart';

class VerifikasiEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiEmailController>(
      () => VerifikasiEmailController(),
    );
  }
}
