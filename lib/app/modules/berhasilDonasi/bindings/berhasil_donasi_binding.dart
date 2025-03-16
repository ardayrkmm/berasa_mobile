import 'package:get/get.dart';

import '../controllers/berhasil_donasi_controller.dart';

class BerhasilDonasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerhasilDonasiController>(
      () => BerhasilDonasiController(),
    );
  }
}
