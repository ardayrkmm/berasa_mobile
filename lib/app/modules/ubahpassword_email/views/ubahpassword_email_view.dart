import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/Inputan.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubahpassword_email_controller.dart';

class UbahpasswordEmailView extends GetView<UbahpasswordEmailController> {
  const UbahpasswordEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
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
              nama: "Selanjutnya",

              fungsi: () {
                Get.toNamed(Routes.VERIFIKASI_UBAH_PASSWORD);
              },
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
              "Reset Password",
              style: biruStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),

            Text(
              "Untuk mendapatkan kode verifikasi\nmasukan email dahulu",
              style: biruStyle.copyWith(fontSize: 15, fontWeight: light),
            ),

            SizedBox(height: 40),
            Inputan(
              w: double.infinity,
              cs: emailC,
              h: 50,
              icon: "assets/email.png",
              labelInput: "Masukan email kamu",
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
