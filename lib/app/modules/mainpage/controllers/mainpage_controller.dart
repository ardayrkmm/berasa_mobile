import 'package:get/get.dart';

class MainpageController extends GetxController {
  //TODO: Implement MainpageController

  RxInt angka = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void diPilih(int index) {
    angka.value = index;
  }
}
