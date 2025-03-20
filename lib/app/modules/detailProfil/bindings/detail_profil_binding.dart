import 'package:get/get.dart';

import '../controllers/detail_profil_controller.dart';

class DetailProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfilController>(
      () => DetailProfilController(),
    );
  }
}
