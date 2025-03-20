import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/InputDonasi.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/donasi_controller.dart';

class DonasiView extends GetView<DonasiController> {
  const DonasiView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController k = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Donasi",
          style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: marginSemua, right: marginSemua),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Donasi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 50, cs: k, labelInput: ""),

                Text(
                  "Deskripsi Donasi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),

                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 90, cs: k, labelInput: ""),
                Text(
                  "Alamat",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),

                SizedBox(height: 15),
                InputDonasi(w: double.infinity, h: 90, cs: k, labelInput: ""),
                BtnBaru(
                  w: double.infinity,
                  h: 50,
                  nama: "Selanjutnya",
                  fungsi: () {
                    Get.toNamed(Routes.LIST_BARANG_DONASI);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
