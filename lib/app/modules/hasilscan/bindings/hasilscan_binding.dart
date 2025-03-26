import 'package:get/get.dart';

import '../controllers/hasilscan_controller.dart';

class HasilscanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilscanController>(
      () => HasilscanController(),
    );
  }
}
