import 'package:get/get.dart';

import '../controllers/ubahpassword_passwordbaru_controller.dart';

class UbahpasswordPasswordbaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahpasswordPasswordbaruController>(
      () => UbahpasswordPasswordbaruController(),
    );
  }
}
