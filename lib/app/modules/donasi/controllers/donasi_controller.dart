import 'package:berasa_mobile/app/data/Model/DonasiModel.dart';
import 'package:berasa_mobile/app/modules/piliLokasi/controllers/pili_lokasi_controller.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DonasiController extends GetxController {
  final namaDonasi = TextEditingController();

  final alamat = TextEditingController();
  final deskripsiController = TextEditingController();

  final PiliLokasiController locationController = Get.put(
    PiliLokasiController(),
  );
  @override
  void onInit() {
    super.onInit();
    clearForm();
  }

  void clearForm() {
    namaDonasi.clear();
    alamat.clear();
    deskripsiController.clear();
    locationController.latitude.value = 0.0;
    locationController.longitude.value = 0.0;
  }

  @override
  void onClose() {
    namaDonasi.dispose();

    alamat.dispose();
    deskripsiController.dispose();

    super.onClose();
  }

  void tambah() {
    final DonasiModel donasi = DonasiModel(
      nama: namaDonasi.text,
      alamat: alamat.text,
      barangDonasi: [],
      deskripsi: deskripsiController.text,
      latitude: locationController.latitude.value.toString(),
      longitude: locationController.longitude.value.toString(),
    );

    Get.toNamed(Routes.LIST_BARANG_DONASI, arguments: donasi);
  }
}
