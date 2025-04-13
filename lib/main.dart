import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  String cekPengguna() {
    final box = GetStorage();
    final token = box.read("token");

    if (token != null && !JwtDecoder.isExpired(token)) {
      return Routes.MAINPAGE;
    } else {
      return Routes.SPLASH;
    }
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      locale: Locale('id', 'ID'),
      initialRoute: cekPengguna(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    ),
  );
}
