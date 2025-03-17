import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerifikasiUbahPasswordController extends GetxController {
  //TODO: Implement VerifikasiUbahPasswordController

  final int jumlah = 4;
  late List<TextEditingController> controller;
  late List<FocusNode> fokus;
  @override
  void onInit() {
    super.onInit();
    controller = List.generate(jumlah, (index) => TextEditingController());
    fokus = List.generate(jumlah, (index) => FocusNode());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    for (var s in controller) {
      s.dispose();
    }
    for (var n in fokus) {
      n.dispose();
    }
    super.onClose();
  }

  void pindahKetik(String value, int index) {
    if (value.isNotEmpty && index < jumlah - 1) {
      fokus[index + 1].requestFocus();
    } else if (value.isNotEmpty && index > 0) {
      fokus[index - 1].requestFocus();
    }
  }
}
