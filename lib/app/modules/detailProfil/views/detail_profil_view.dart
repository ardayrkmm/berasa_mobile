import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProfilView extends StatelessWidget {
  const DetailProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bagianHeader() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 388,
        decoration: BoxDecoration(
          gradient: biruGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/pp.jpg"),
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
        child: Column(
          children: [
            infoItem("assets/nama.png", "Nama", "Arda Yudrik M"),
            infoItem("assets/email.png", "Email", "ardaku@gmail.com"),
            infoItem("assets/telp.png", "No Telp", "081237237"),
            infoItem(
              "assets/lokasiitem.png",
              "Alamat",
              "Jl. Panggung no 56, Tetangga Anin",
            ),
          ],
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
