import 'dart:io';

import 'package:berasa_mobile/app/data/Model/BarangDonasiModel.dart';
import 'package:berasa_mobile/app/data/Model/GaleriGambarMakanan.dart';
import 'package:berasa_mobile/app/data/Model/JenisModel.dart';
import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:berasa_mobile/app/modules/listBarangDonasi/controllers/list_barang_donasi_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormDonasiController extends GetxController {
  final namaController = TextEditingController();

  final jumlahController = TextEditingController();
  final deskripsiController = TextEditingController();
  final batasWaktuController = TextEditingController();
  final Dio dio = Dio();
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () => ambilJenis());
  }

  @override
  void onClose() {
    namaController.dispose();

    jumlahController.dispose();
    deskripsiController.dispose();
    batasWaktuController.dispose();
    super.onClose();
  }

  final ListBarangDonasiController listC = Get.find();

  var jenis = <Jenismodel>[].obs;
  var pilihJensi = Rxn<Jenismodel>();
  var gambarList = <Galerigambarmakanan>[].obs;

  void ambilJenis() async {
    try {
      var Respon = await dio.get("${Urls().url}/jenis/baca");

      if (Respon.statusCode == 200) {
        jenis.assignAll(
          Respon.data.map<Jenismodel>((data) => Jenismodel.fromJson(data)),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal mengambil data jenis");
      print("Error fetching jenis: $e");
    }
  }

  Future<void> ambilGambar() async {
    final ambil = ImagePicker();
    final ambilFile = await ambil.pickMultiImage();
    if (ambilFile != null) {
      for (var file in ambilFile) {
        gambarList.add(Galerigambarmakanan(url: file.path));
      }
    }
  }

  void hapusGambar(int index) {
    gambarList.removeAt(index);
  }

  void tambahBarang() {
    if (pilihJensi.value == null) {
      Get.snackbar("Error", "Pilih jenis terlebih dahulu");
      return;
    }

    if (namaController.text.isEmpty ||
        jumlahController.text.isEmpty ||
        deskripsiController.text.isEmpty ||
        batasWaktuController.text.isEmpty) {
      Get.snackbar("Error", "Isi semua data sebelum lanjut!");
      return;
    }

    var barang = BarangDonasiModel(
      namaMakanan: namaController.text,
      idJenis: pilihJensi.value!.id,
      jumlahPorsi: int.tryParse(jumlahController.text) ?? 0,
      deksripsi: deskripsiController.text,
      batasKonsumsi: batasWaktuController.text,
      galeriMakanan: List.from(gambarList),
    );

    listC.tambahBarang(barang);
    hapusForm();
    Get.back(result: barang);
  }

  void hapusForm() {
    namaController.clear();
    jumlahController.clear();
    deskripsiController.clear();
    batasWaktuController.clear();
    gambarList.clear();
    pilihJensi.value = null;
  }
}
