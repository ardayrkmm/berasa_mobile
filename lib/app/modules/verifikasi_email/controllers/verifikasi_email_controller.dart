import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:berasa_mobile/app/modules/splash/views/Loading.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifikasiEmailController extends GetxController {
  //TODO: Implement VerifikasiEmailController

  final int jumlah = 6;
  late List<TextEditingController> controller;
  late List<FocusNode> fokus;
  RxBool cekLoading = false.obs;
  final Dio _dio = Dio();
  String getKodeVerifikasi() {
    return controller.map((c) => c.text).join();
  }

  late String email;
  bool isValidKode() {
    String kode = getKodeVerifikasi();
    if (kode.length < jumlah) {
      Get.snackbar("Error", "Kode verifikasi harus $jumlah digit!");
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    controller = List.generate(jumlah, (index) => TextEditingController());
    fokus = List.generate(jumlah, (index) => FocusNode());
    final args = Get.arguments as Map<String, dynamic>?;
    email = args?["email"] ?? "";
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

  Future<void> verifikasiEmail(String code) async {
    if (!isValidKode()) return;

    try {
      cekLoading.value = true;
      Get.off(() => LoadingPage());
      final response = await _dio.post(
        "${Urls().url}/auth/verify-email",
        data: {"email": email, "code": code},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Sukses", "Verifikasi berhasil, silakan login!");
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar("Error", response.data["message"] ?? "Verifikasi gagal");
      }
    } on DioException catch (e) {
      String errorMessage = "Terjadi kesalahan";
      if (e.response != null) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Koneksi timeout, cek jaringan!";
      }
      Get.snackbar("Error", errorMessage);
    } finally {
      cekLoading.value = false;
    }
  }

  void pindahKetik(String value, int index) {
    if (value.isNotEmpty && index < jumlah - 1) {
      fokus[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      fokus[index - 1].requestFocus();
    }
  }
}
