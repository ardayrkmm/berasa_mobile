import 'package:berasa_mobile/app/Widget/CardProgram.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Widget bagianHeader() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 20),
        height: 390,
        decoration: BoxDecoration(
          gradient: biruGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: putih,
                      borderRadius: BorderRadius.circular(10000),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang,",
                          style: putihSty.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          "Arda yudrik M",
                          style: putihSty.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/notif.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: double.infinity,
              height: 169,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage("assets/ilhead.png")),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LEADERBOARD);
                  },
                  child: Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: putih,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Center(child: Icon(Icons.leaderboard, color: biru)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HALAMAN_MAPS);
                  },
                  child: Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: putih,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Center(child: Icon(Icons.map, color: biru)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bagianBawah() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Program Donasi",
              style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
            ),

            CardProgram(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: putih),
        child: ListView(children: [bagianHeader(), bagianBawah()]),
      ),
    );
  }
}
