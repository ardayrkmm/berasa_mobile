import 'dart:convert';

import 'package:berasa_mobile/app/data/Model/DonasiModel.dart';
import 'package:berasa_mobile/app/data/Url/Urls.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RiwayatController extends GetxController {
  var prosesList = <DonasiModel>[].obs;
  var selesaiList = <DonasiModel>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ambilRiwayat("proses");
    ambilRiwayat("selesai");
  }

  Future<void> ambilRiwayat(String status) async {
    try {
      isLoading.value = true;
      final box = GetStorage();
      final token = box.read('token');
      final respons = await http.get(
        Uri.parse("${Urls().url}/donasi/riwayat?status=${status}"),
        headers: {"Authorization": "Bearer ${token}"},
      );

      if (respons.statusCode == 200) {
        final body = json.decode(respons.body);
        print("RESP [$status]: $body");

        if (body["riwayat_donasi"] != null && body["riwayat_donasi"] is List) {
          final List data = body["riwayat_donasi"];
          final barang = data.map((e) => DonasiModel.fromJson(e)).toList();

          if (status == "proses") {
            prosesList.assignAll(barang);
          } else {
            selesaiList.assignAll(barang);
          }
        } else {
          if (status == "proses") {
            prosesList.clear();
          } else {
            selesaiList.clear();
          }
          print("riwayat_donasi null atau bukan List");
        }
      } else {
        print("Gagal fetch data");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
