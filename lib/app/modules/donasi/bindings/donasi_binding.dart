import 'package:get/get.dart';

import '../controllers/donasi_controller.dart';

class DonasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonasiController>(
      () => DonasiController(),
    );
  }
}
