import 'package:get/get.dart';

import '../controllers/list_barang_donasi_controller.dart';

class ListBarangDonasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBarangDonasiController>(
      () => ListBarangDonasiController(),
    );
  }
}
