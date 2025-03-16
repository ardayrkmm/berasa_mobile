import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/Inputan.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDonasiView extends StatelessWidget {
  const FormDonasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donasi",
          style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: marginSemua, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Makanan",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 50,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 12),

              Text(
                "Jenis Makanan",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 50,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 12),

              Text(
                "Jumlah Porsi",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 50,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 12),

              Text(
                "Deskripsi Makanan",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 100,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 12),

              Text(
                "Batas Waktu Konsumsi",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 50,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 12),

              Text(
                "Alamat",
                style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(height: 15),
              Inputan(
                w: double.infinity,
                h: 100,
                icon: "assets/input_icon.png",
                labelInput: "",
              ),
              SizedBox(height: 30),

              BtnBaru(
                w: double.infinity,
                h: 50,
                nama: "Selanjutnya",
                fungsi: () {
                  // Tambahkan fungsi navigasi atau aksi selanjutnya
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
