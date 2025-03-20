import 'package:berasa_mobile/app/modules/splash/views/Loading.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:berasa_mobile/app/data/Url/Urls.dart';

class RegisterController extends GetxController {
  final Dio _dio = Dio();
  RxBool cekLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomerTeleponC = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    nomerTeleponC.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> buatAkun(
    String email,
    String password,
    String nomer,
    String nama,
  ) async {
    try {
      cekLoading.value = true;

      Get.off(() => LoadingPage());
      final response = await _dio.post(
        "${Urls().url}/auth/register",
        data: {
          "email": email,
          "nama": nama,
          "password": password,
          "nomer_telepon": nomer,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.VERIFIKASI_EMAIL, arguments: {"email": email});
      } else {
        Get.snackbar("Error", "Register gagal: ${response.data['message']}");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      cekLoading.value = false;
    }
  }
}
