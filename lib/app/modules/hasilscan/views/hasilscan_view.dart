import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hasilscan_controller.dart';

class HasilscanView extends GetView<HasilscanController> {
  const HasilscanView({super.key});
  @override
  Widget build(BuildContext context) {
    Widget bagianHeader() {
      return Container(
        padding: EdgeInsets.all(marginSemua),
        width: MediaQuery.of(context).size.width,
        height: 446,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          image: DecorationImage(
            image: AssetImage("assets/ilhead.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: putih),
            ),
          ],
        ),
      );
    }

    Widget bagianContent() {
      Widget bagianCard() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 82,
              height: 148,
              decoration: BoxDecoration(
                color: biruCerah,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 4),
                  Icon(Icons.sunny, color: biru, size: 30),
                  Container(
                    width: 82,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: biruGradient,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kalori",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          "250kcal",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 82,
              height: 148,
              decoration: BoxDecoration(
                color: biruCerah,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 4),
                  Icon(Icons.sunny, color: biru, size: 30),
                  Container(
                    width: 82,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: biruGradient,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Protein",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          "25g",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 82,
              height: 148,
              decoration: BoxDecoration(
                color: biruCerah,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 4),
                  Icon(Icons.sunny, color: biru, size: 30),
                  Container(
                    width: 82,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: biruGradient,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fat",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          "15g",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ayam Goreng",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 18),
            Text(
              "Data Nutrisi",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              "Data Nutrisi di hitung per 100gr",
              style: abu2Sty.copyWith(fontSize: 14, fontWeight: light),
            ),
            SizedBox(height: 18),
            bagianCard(),
            SizedBox(height: 18),
            Text(
              "Waktu Basi",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18, top: 18),
              child: Row(
                children: [
                  Icon(Icons.circle, color: biru, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Data Nutrisi",
                    style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Icon(Icons.circle, color: biru, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Data Nutrisi",
                    style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Rekomendasi",
              style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18, top: 18),
              child: Row(
                children: [
                  Icon(Icons.circle, color: biru, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Data Nutrisi",
                    style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Icon(Icons.circle, color: biru, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Data Nutrisi",
                    style: abu2Sty.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: putih,
      body: ListView(children: [bagianHeader(), bagianContent()]),
    );
  }
}
