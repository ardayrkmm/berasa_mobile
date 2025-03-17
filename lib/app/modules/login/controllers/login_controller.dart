import 'package:berasa_mobile/app/data/Model/userModel.dart';
import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:berasa_mobile/app/modules/splash/views/Loading.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  final Dio _dio = Dio();
  RxBool cekLoading = false.obs;
  final box = GetStorage();
  Rx<Usermodel?> currentUser = Rx<Usermodel?>(null);

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();

    super.onClose();
  }

  Future<void> login(String email, String password) async {
    try {
      cekLoading.value = true;
      Get.off(() => LoadingPage());

      final respon = await _dio.post(
        "${Urls().url}/auth/login",
        data: {"email": email, "password": password},
      );

      print("Response Data: ${respon.data}");

      if (respon.data == null ||
          !respon.data.containsKey("user") ||
          !respon.data.containsKey("token")) {
        Get.snackbar("Error", "Response tidak valid!");
        return;
      }

      String? token = respon.data["token"];
      var userData = respon.data["user"];

      if (token == null || userData == null) {
        Get.snackbar("Error", "Token atau data user tidak valid!");
        return;
      }

      Usermodel user = Usermodel.fromJson(userData);

      if (!user.isVerified) {
        Get.toNamed(Routes.VERIFIKASI_EMAIL, arguments: {"email": email});
        return;
      }

      box.write("token", token);
      box.write("user", user.toJson());
      currentUser.value = user;

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      cekLoading.value = false;
    }
  }

  bool isLoggedIn() {
    return box.hasData("token");
  }

  void logout() {
    box.remove("token"); // Hapus token
    box.remove("user"); // Hapus data user
    currentUser.value = null;
    Get.offAllNamed("/login");
  }
}
