import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/app/Widget/InputDonasi.dart';
import 'package:berasa_mobile/app/modules/piliLokasi/controllers/pili_lokasi_controller.dart';
import 'package:berasa_mobile/app/modules/piliLokasi/views/pili_lokasi_view.dart';
import 'package:berasa_mobile/app/routes/app_pages.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/donasi_controller.dart';

class DonasiView extends GetView<DonasiController> {
  DonasiView({super.key});
  @override
  Widget build(BuildContext context) {
    final DonasiController cs = Get.find<DonasiController>();
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
                InputDonasi(
                  w: double.infinity,
                  h: 50,
                  cs: cs.namaDonasi,
                  labelInput: "",
                ),

                Text(
                  "Deskripsi Donasi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),

                SizedBox(height: 15),
                InputDonasi(
                  w: double.infinity,
                  h: 90,
                  cs: controller.deskripsiController,
                  labelInput: "",
                ),

                Text(
                  "Alamat",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 15),
                InputDonasi(
                  w: double.infinity,
                  h: 90,
                  cs: cs.alamat,
                  labelInput: "",
                ),

                Text(
                  "Titik Lokasi Donasi",
                  style: abu2Sty.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(height: 10),

                Obx(() {
                  return Container(
                    height: 150, // Ukuran minimap
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(
                          cs.locationController.latitude.value,
                          cs.locationController.longitude.value,
                        ),
                        initialZoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(
                                cs.locationController.latitude.value,
                                cs.locationController.longitude.value,
                              ),
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: cs.locationController.getCurrentLocation,
                  child: Text("Ambil Lokasi Sekarang"),
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () async {
                    LatLng? lokasiTerpilih = await Get.to<LatLng>(
                      () => PiliLokasiView(),
                    );

                    if (lokasiTerpilih != null) {
                      cs.locationController.latitude.value =
                          lokasiTerpilih.latitude;
                      cs.locationController.longitude.value =
                          lokasiTerpilih.longitude;
                    }
                  },
                  child: Text("Pilih Lokasi di Peta"),
                ),

                BtnBaru(
                  w: double.infinity,
                  h: 50,
                  nama: "Selanjutnya",
                  fungsi: cs.tambah,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
