import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:berasa_mobile/tema.dart';

import '../controllers/list_barang_donasi_controller.dart';

class ListBarangDonasiView extends GetView<ListBarangDonasiController> {
  const ListBarangDonasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putih,
      appBar: AppBar(
        title: Text(
          'List Donasi',
          style: abu2Sty.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: putih,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.FORM_DONASI);
            },
            icon: Icon(Icons.add, color: biru, size: 30),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            controller.barangDonasi.isEmpty
                ? Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/berhasil.png"),
                            ),
                          ),
                        ),
                        Text(
                          'Belum Ada data donasinya ya',
                          textAlign: TextAlign.center,
                          style: abu2Sty.copyWith(
                            fontSize: 20,
                            color: abu2,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'Silahkan tambah barang\ndonasi dahulu ya',
                          textAlign: TextAlign.center,
                          style: abu2Sty.copyWith(
                            fontSize: 18,
                            color: abu2,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : Expanded(
                  child: ListView.builder(
                    itemCount: controller.barangDonasi.length,
                    itemBuilder: (context, index) {
                      final brang = controller.barangDonasi[index];
                      return ListTile(
                        title: Text(brang.deksripsi),
                        subtitle: Text(
                          "Jenis: ${brang.namaMakanan}, Jumlah: ${brang.jumlahPorsi}",
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.hapus(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
            if (controller.barangDonasi.isNotEmpty)
              BtnBaru(
                fungsi: () => controller.kirim(controller.barangDonasi),
                h: 44,
                w: double.infinity,
                nama: "Selanjutnya",
              ),
          ],
        ),
      ),
    );
  }
}
