import 'package:berasa_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DetailProfilView extends StatelessWidget {
  const DetailProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    Widget bagianHeader() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 388,
        padding: EdgeInsets.all(marginSemua),
        decoration: BoxDecoration(
          gradient: biruGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, color: putih),
              ),
            ),
            Obx(
              () => Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    "http://192.168.1.5:5000/static/uploads/${loginC.user!.img_profil}",
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget infoItem(String icon, String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 40,
        ), // Tambah jarak kiri
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(icon, width: 20),
            SizedBox(width: 20), // Tambah jarak antara ikon dan teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: abu2Sty.copyWith(fontSize: 14, fontWeight: light),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bagianContent() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: putih,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              infoItem("assets/nama.png", "Nama", loginC.user!.nama),
              infoItem("assets/email.png", "Email", loginC.user!.email),
              infoItem(
                "assets/telp.png",
                "No Telp",
                loginC.user!.nomer_telepon,
              ),
              infoItem(
                "assets/lokasiitem.png",
                "Alamat",
                loginC.user!.alamat.isEmpty
                    ? "Belum ada alamat,\nsilahkan Update alamatnya"
                    : loginC.user!.alamat,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [bagianHeader(), Expanded(child: bagianContent())],
      ),
    );
  }
}
