import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: marginSemua),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 203,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/sp.png")),
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Ayo berbagi kebahagiaan\nbersama teman teman",
              textAlign: TextAlign.center,
              style: abu2Sty.copyWith(fontSize: 22, fontWeight: bold),
            ),
            SizedBox(height: 18),
            Text(
              "Berasa tempat berbagi makanan untuk\nsemua orang",
              textAlign: TextAlign.center,
              style: abu2Sty.copyWith(fontSize: 16, fontWeight: light),
            ),

            SizedBox(height: 40),
            BtnBaru(
              w: double.infinity,
              h: 50,
              fungsi: () {
                Get.offNamed(Routes.SPLASH1);
              },
              nama: "Selanjutnya",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: light),
                ),
                Text(
                  "Masuk",
                  style: biruStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
