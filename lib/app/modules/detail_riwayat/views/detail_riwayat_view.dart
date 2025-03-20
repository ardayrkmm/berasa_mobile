import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_riwayat_controller.dart';

class DetailRiwayatView extends GetView<DetailRiwayatController> {
  const DetailRiwayatView({super.key});
  @override
  Widget build(BuildContext context) {
    Widget bagianAppBar() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: marginSemua),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: putih),
            ),
            Expanded(
              child: Text(
                'Riwayat',
                textAlign: TextAlign.center,
                style: putihSty.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ),
          ],
        ),
      );
    }

    Widget bagianHeader() {
      return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: marginSemua),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: putih,
              ),
            ),
            SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kegiatan berkah",
                        style: putihSty.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),

                      Text(
                        "Kegiatan berkah",
                        style: putihSty.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 160,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: putih,
                  ),
                  child: Center(
                    child: Text(
                      "Proses",
                      style: biruStyle.copyWith(fontSize: 18, fontWeight: bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bagianContent() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        height: 650,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: putih,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Donasi",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 18),
            Text(
              "Nasi Ayam Donski",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              "12 januari 2023, Pukul 12.40",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: light),
            ),
            SizedBox(height: 18),
            Text(
              "Jumlah",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              "20",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: light),
            ),
            SizedBox(height: 18),
            Text(
              "Tempat Donasi",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              "Jakarta",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: light),
            ),
            SizedBox(height: 18),
            Text(
              "Estimasi Diserahkan",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              "Jakarta",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: light),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: biruGradient),
        child: ListView(
          children: [bagianAppBar(), bagianHeader(), bagianContent()],
        ),
      ),
    );
  }
}
