import 'dart:io';

import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/InputDonasi.dart';
import 'package:berasa_mobile/app/data/Model/JenisModel.dart';
import 'package:berasa_mobile/app/modules/formDonasi/controllers/form_donasi_controller.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDonasiView extends GetView<FormDonasiController> {
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
                InputDonasi(
                  w: double.infinity,
                  h: 50,
                  cs: controller.namaController,
                  labelInput: "",
                ),
                SizedBox(height: 12),
                Text(
                  "Tambahkan Gambar",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                Obx(
                  () => Wrap(
                    spacing: 10,
                    children: [
                      ...controller.gambarList.map(
                        (file) => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: FileImage(File(file.url)),

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap:
                                    () => controller.hapusGambar(
                                      controller.gambarList.indexOf(file),
                                    ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 12,
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.ambilGambar(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(color: Colors.green),
                          ),
                          child: Icon(Icons.add, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),
                Text(
                  "Jenis Makanan",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                Obx(
                  () => DropdownButtonFormField<Jenismodel>(
                    items:
                        controller.jenis.map((jenis) {
                          return DropdownMenuItem(
                            value: jenis,
                            child: Text(jenis.nama),
                          );
                        }).toList(),
                    onChanged: (value) {
                      controller.pilihJensi.value = value;
                    },
                    decoration: InputDecoration(labelText: "Jenis Makanan"),
                  ),
                ),
                SizedBox(height: 12),

                Text(
                  "Jumlah Porsi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(
                  w: double.infinity,
                  cs: controller.jumlahController,
                  h: 50,
                  labelInput: "",
                ),
                SizedBox(height: 12),

                Text(
                  "Deskripsi Makanan",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(
                  w: double.infinity,
                  h: 100,
                  cs: controller.deskripsiController,
                  labelInput: "",
                ),
                SizedBox(height: 12),

                Text(
                  "Batas Waktu Konsumsi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(
                  w: double.infinity,
                  h: 50,
                  labelInput: "",
                  cs: controller.batasWaktuController,
                ),

                BtnBaru(
                  w: double.infinity,
                  h: 50,
                  nama: "Selanjutnya",
                  fungsi: controller.tambahBarang,
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
