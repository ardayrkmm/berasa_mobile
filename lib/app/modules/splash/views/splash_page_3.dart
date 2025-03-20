import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashPage3View extends GetView {
  const SplashPage3View({super.key});
  @override
  Widget build(BuildContext context) {
    Widget bagianContent() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 18),
        child: Column(
          children: [
            Text(
              "Baresa dengan teknologi\nAI",
              textAlign: TextAlign.center,
              style: abu2Sty.copyWith(fontSize: 22, fontWeight: bold),
            ),
            SizedBox(height: 10),
            Text(
              "Fitur dari berasa memiliki teknologi AI\nayo cobain sekarang",
              textAlign: TextAlign.center,
              style: abu2Sty.copyWith(fontSize: 16, fontWeight: light),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3000),
                          color: biru.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3000),
                          color: biru.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3000),
                          color: biru,
                        ),
                      ),
                    ],
                  ),
                ),
                BtnBaru(
                  w: 88,
                  h: 50,
                  fungsi: () {
                    Get.offNamed(Routes.REGISTER);
                  },
                  nama: "Next",
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: putih,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 545,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/sp3.png"),
              ),
            ),
          ),
          bagianContent(),
        ],
      ),
    );
  }
}
