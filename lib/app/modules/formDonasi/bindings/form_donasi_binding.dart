import 'package:get/get.dart';

import '../controllers/form_donasi_controller.dart';

class FormDonasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormDonasiController>(
      () => FormDonasiController(),
    );
  }
}
