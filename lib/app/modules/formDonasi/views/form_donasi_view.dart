import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/InputDonasi.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDonasiView extends StatelessWidget {
  const FormDonasiView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController k = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Barang Donasi",
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: marginSemua, right: marginSemua),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Makanan",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 50, cs: k, labelInput: ""),
                SizedBox(height: 12),

                Text(
                  "Jenis Makanan",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(cs: k, w: double.infinity, h: 50, labelInput: ""),
                SizedBox(height: 12),

                Text(
                  "Jumlah Porsi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(w: double.infinity, cs: k, h: 50, labelInput: ""),
                SizedBox(height: 12),

                Text(
                  "Deskripsi Makanan",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 100, cs: k, labelInput: ""),
                SizedBox(height: 12),

                Text(
                  "Batas Waktu Konsumsi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 50, labelInput: "", cs: k),

                BtnBaru(
                  w: double.infinity,
                  h: 50,
                  nama: "Selanjutnya",
                  fungsi: () {
                    // Tambahkan fungsi navigasi atau aksi selanjutnya
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
