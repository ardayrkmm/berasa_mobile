import 'dart:convert';
import 'dart:io';

import 'package:berasa_mobile/app/data/Model/BarangDonasiModel.dart';
import 'package:berasa_mobile/app/data/Model/DonasiModel.dart';
import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:berasa_mobile/app/modules/splash/views/Loading.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ListBarangDonasiController extends GetxController {
  var barangDonasi = <BarangDonasiModel>[].obs;
  RxBool cekLoading = false.obs;

  void tambahBarang(BarangDonasiModel barang) {
    barangDonasi.add(barang);
  }

  late DonasiModel donasi;

  @override
  void onInit() {
    super.onInit();
    donasi = Get.arguments as DonasiModel;
  }

  Future<void> kirim(List<BarangDonasiModel> barangList) async {
    final box = GetStorage();
    final token = box.read('token');

    if (barangList.isEmpty) {
      Get.snackbar("Peringatan", "Belum ada barang yang ditambahkan");
      return;
    }

    try {
      cekLoading.value = true;
      Get.off(() => LoadingPage());

      var uri = Uri.parse("${Urls().url}/donasi/tambah");
      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $token';

      // Data donasi
      request.fields['nama'] = donasi.nama;
      request.fields['deskripsi'] = donasi.deskripsi;
      request.fields['alamat'] = donasi.alamat;
      request.fields['latitude'] = donasi.latitude;
      request.fields['longitude'] = donasi.longitude;

      // Barang donasi
      request.fields['barang_donasi'] = jsonEncode(
        barangList.map((e) => e.toJson()).toList(),
      );

      // Upload gambar sesuai index barang
      for (int i = 0; i < barangList.length; i++) {
        var barang = barangList[i];

        for (int j = 0; j < barang.galeriMakanan.length; j++) {
          var gambar = barang.galeriMakanan[j];
          File file = File(gambar.url);

          if (await file.exists()) {
            final mimeType = lookupMimeType(file.path)?.split('/');
            final multipartFile = await http.MultipartFile.fromPath(
              'galeri_makanan_$i',
              file.path,
              contentType:
                  mimeType != null
                      ? MediaType(mimeType[0], mimeType[1])
                      : MediaType('image', 'jpeg'),
            );
            request.files.add(multipartFile);
          } else {
            print("File tidak ditemukan: ${gambar.url}");
          }
        }
      }

      // Kirim
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Response: ${response.body}");
        barangDonasi.clear();
        Get.toNamed(Routes.BERHASIL_DONASI);
      } else {
        print("❌ Gagal: ${response.statusCode}");
        print(response.body);
        Get.snackbar("Error", "Gagal mengirim data.");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
      print("ERROR = $e");
    } finally {
      cekLoading.value = false;
    }
  }

  void hapus(int index) {
    barangDonasi.removeAt(index);
  }
}
