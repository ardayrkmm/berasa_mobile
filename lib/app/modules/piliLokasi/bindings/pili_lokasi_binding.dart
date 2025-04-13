import 'package:get/get.dart';

import '../controllers/pili_lokasi_controller.dart';

class PiliLokasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PiliLokasiController>(
      () => PiliLokasiController(),
    );
  }
}
