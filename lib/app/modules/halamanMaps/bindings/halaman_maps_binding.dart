import 'package:get/get.dart';

import '../controllers/halaman_maps_controller.dart';

class HalamanMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanMapsController>(
      () => HalamanMapsController(),
    );
  }
}
