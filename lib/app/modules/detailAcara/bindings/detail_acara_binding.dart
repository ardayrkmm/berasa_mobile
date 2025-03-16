import 'package:get/get.dart';

import '../controllers/detail_acara_controller.dart';

class DetailAcaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAcaraController>(
      () => DetailAcaraController(),
    );
  }
}
