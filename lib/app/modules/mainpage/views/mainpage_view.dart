import 'package:berasa_mobile/app/modules/berhasilDonasi/views/berhasil_donasi_view.dart';
import 'package:berasa_mobile/app/modules/detailAcara/views/detail_acara_view.dart';
import 'package:berasa_mobile/app/modules/donasi/views/donasi_view.dart';
import 'package:berasa_mobile/app/modules/formDonasi/views/form_donasi_view.dart';
import 'package:berasa_mobile/app/modules/home/views/home_view.dart';
import 'package:berasa_mobile/app/modules/riwayat/views/riwayat_view.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mainpage_controller.dart';

class MainpageView extends GetView<MainpageController> {
  const MainpageView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> halaman = [
      HomeView(),
      DonasiView(),
      RiwayatView(),
      DetailAcaraView(),
    ];
    Widget ItemNavbar(String url, int index) {
      return GestureDetector(
        onTap: () {
          controller.diPilih(index);
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            child: Image.asset(
              url,
              width: 25,
              height: 25,
              color:
                  controller.angka.value == index
                      ? putih
                      : putih.withOpacity(0.5),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.SCAN);
        },
        shape: CircleBorder(),
        backgroundColor: Color(0xffC1DFFD),
        child: Image.asset("assets/scan.png", width: 40, height: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BottomAppBar(
          color: biru,
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemNavbar("assets/home.png", 0),
              ItemNavbar("assets/donasi.png", 1),
              SizedBox(width: 25),
              ItemNavbar("assets/riwayat.png", 2),
              ItemNavbar("assets/profil.png", 3),
            ],
          ),
        ),
      ),
      body: Obx(() => halaman[controller.angka.value]),
    );
  }
}
