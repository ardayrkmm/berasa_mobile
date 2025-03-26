import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HalamanMapsController extends GetxController {
  var lokasiPengguna = LatLng(-6.1751, 106.8650).obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    ambilLokasiPengguna();
  }

  Future<void> ambilLokasiPengguna() async {
    bool serviceEnable;
    LocationPermission pr;

    serviceEnable = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnable) {
      return tampilkanBottomSheet(
        "Lokasi Tidak Aktif",
        "Aktifkan lokasi untuk menggunakan fitur ini.",
        "Aktifkan",
        () => Geolocator.openLocationSettings(),
      );
    }

    pr = await Geolocator.checkPermission();
    if (pr == LocationPermission.denied) {
      pr = await Geolocator.requestPermission();
      if (pr == LocationPermission.denied) {
        return tampilkanBottomSheet(
          "Izin Lokasi Ditolak",
          "Aplikasi membutuhkan akses lokasi untuk melanjutkan.",
          "Izinkan",
          () => ambilLokasiPengguna(),
        );
      }
    }

    if (pr == LocationPermission.deniedForever) {
      return tampilkanBottomSheet(
        "Izin Lokasi Diblokir",
        "Buka pengaturan dan berikan akses lokasi ke aplikasi.",
        "Buka Pengaturan",
        () => Geolocator.openAppSettings(),
      );
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    lokasiPengguna.value = LatLng(position.latitude, position.longitude);
    loading.value = false;
  }

  void tampilkanBottomSheet(
    String title,
    String message,
    String buttonText,
    VoidCallback onPressed,
  ) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(message, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
                onPressed();
              },
              child: Text(buttonText),
            ),
            TextButton(onPressed: () => Get.back(), child: Text("Batal")),
          ],
        ),
      ),
    );
  }
}
