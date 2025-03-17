import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verifikasi_ubah_password_controller.dart';

class VerifikasiUbahPasswordView
    extends GetView<VerifikasiUbahPasswordController> {
  final VerifikasiUbahPasswordController emailController =
      Get.find<VerifikasiUbahPasswordController>();
  VerifikasiUbahPasswordView({super.key});
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
              nama: "Selanjutnya",
              fungsi: () {
                Get.toNamed(Routes.UBAHPASSWORD_PASSWORDBARU);
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
              "Masukan kode verifikasi yang\nberada di email kamu",
              style: biruStyle.copyWith(fontSize: 15, fontWeight: light),
            ),
            SizedBox(height: 40),
            Row(
              children: List.generate(emailController.jumlah, (e) {
                return Container(
                  margin: EdgeInsets.only(right: 18),
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: abu2Cerah,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: TextField(
                      controller: emailController.controller[e],
                      focusNode: emailController.fokus[e],
                      maxLength: 1,

                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: abu2Sty.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                      onChanged:
                          (value) => emailController.pindahKetik(value, e),
                      decoration: InputDecoration(
                        hintText: "",
                        hintStyle: abu2Sty.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                        counterText: "",

                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                );
              }),
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
