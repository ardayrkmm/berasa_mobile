import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerhasilDonasiView extends StatelessWidget {
  const BerhasilDonasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/berhasil.png", width: 350),
            SizedBox(height: 24),
            Text(
              "Yey Kamu berhasil Donasi,",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Terima Kasih orang baik",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "Selamat kamu, mendapatkan point",
              style: abu2Sty.copyWith(fontSize: 14, fontWeight: light),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: marginSemua),
              child: BtnBaru(
                w: double.infinity,
                h: 50,
                nama: "Selanjutnya",
                fungsi: () {
                  Get.back(); // Atau arahkan ke halaman lain sesuai kebutuhan
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
