import 'package:berasa_mobile/app/Widget/BtnBaru.dart';
import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/halaman_maps_controller.dart';

class HalamanMapsView extends GetView<HalamanMapsController> {
  const HalamanMapsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Lokasi',
          style: abu2Sty.copyWith(fontSize: 20, fontWeight: bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return FlutterMap(
          options: MapOptions(
            initialCenter:
                controller
                    .lokasiPengguna
                    .value, // Pastikan nilai ini sudah update
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: controller.lokasiPengguna.value,
                  child: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),

                ...controller.penerimaList.map(
                  (f) => Marker(
                    width: 40.0,
                    height: 40.0,
                    point: LatLng(
                      f.latitude.toDouble(),
                      f.longtitude.toDouble(),
                    ),

                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: Get.context!,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 40,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 18),
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: abu2,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Text(
                                    f.nama,
                                    style: abu2Sty.copyWith(
                                      fontSize: 20,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    f.alamat ?? "Alamat tidak tersedia",
                                    style: abu2Sty.copyWith(
                                      fontSize: 14,
                                      fontWeight: light,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  BtnBaru(
                                    w: double.infinity,
                                    h: 44,
                                    nama: "Detail Penerima",
                                    fungsi: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
