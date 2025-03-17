import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/Inputan.dart';
import 'package:berasa_mobile/app/modules/splash/views/Loading.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginC = Get.find<LoginController>();
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    Widget bagianHeader() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: marginSemua),
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.png"),
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo,",
              style: putihSty.copyWith(fontSize: 32, fontWeight: bold),
            ),
            Text(
              "Selamat Datang,",
              style: putihSty.copyWith(fontSize: 18, fontWeight: light),
            ),
            Row(
              children: [
                Text(
                  "di",
                  style: putihSty.copyWith(fontSize: 18, fontWeight: light),
                ),
                SizedBox(width: 4),
                Text(
                  "Berasa",
                  style: putihSty.copyWith(fontSize: 18, fontWeight: bold),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bagianContent() {
      Widget bagianTombol() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BtnBaru(
              w: double.infinity,
              h: 50,
              nama: "Login",
              fungsi: () async {
                await loginC.login(loginC.emailC.text, loginC.passC.text);
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun?",
                  style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Register",
                    style: biruStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Atau",
              style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/gogel.png"),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/fb.png")),
                  ),
                ),
              ],
            ),
          ],
        );
      }

      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: putih,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: biruStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 40),

            Inputan(
              w: double.infinity,
              cs: loginC.emailC,
              h: 50,
              icon: "assets/email.png",
              labelInput: "Masukan email",
            ),

            Inputan(
              w: double.infinity,
              cs: loginC.passC,
              h: 50,
              icon: "assets/pass.png",
              labelInput: "Masukan nomer password",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Lupa Password?",
                  style: abu2Sty.copyWith(fontSize: 12, fontWeight: light),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.UBAHPASSWORD_EMAIL);
                  },
                  child: Text(
                    "Ubah",
                    style: biruStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            bagianTombol(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: biruGradient),
        child: ListView(children: [bagianHeader(), bagianContent()]),
      ),
    );
  }
}
