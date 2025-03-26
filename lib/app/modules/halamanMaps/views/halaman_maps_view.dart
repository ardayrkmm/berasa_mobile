import 'package:berasa_mobile/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';

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
              ],
            ),
          ],
        );
      }),
    );
  }
}
