import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    final token = box.read("token");

    if (token == null || JwtDecoder.isExpired(token)) {
      return const RouteSettings(name: Routes.SPLASH);
    }

    return null; // lanjut aja
  }
}
