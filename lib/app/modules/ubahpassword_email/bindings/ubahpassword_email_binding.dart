import 'package:get/get.dart';

import '../controllers/ubahpassword_email_controller.dart';

class UbahpasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahpasswordEmailController>(
      () => UbahpasswordEmailController(),
    );
  }
}
