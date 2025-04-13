import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/pili_lokasi_controller.dart';

class PiliLokasiView extends GetView<PiliLokasiController> {
  const PiliLokasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pilih Lokasi Donasi")),
      body: Obx(() {
        if (!controller.locationEnabled.value) {
          return Center(
            child: ElevatedButton(
              onPressed: controller.getCurrentLocation,
              child: Text("Izinkan Akses Lokasi"),
            ),
          );
        }

        return FlutterMap(
          options: MapOptions(
            initialCenter:
                controller.selectedLocation.value ?? LatLng(-6.2088, 106.8456),
            initialZoom: 14,
            onTap: (tapPosition, point) {
              controller.updateSelectedLocation(point);
            },
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            if (controller.selectedLocation.value != null)
              MarkerLayer(
                markers: [
                  Marker(
                    width: 50,
                    height: 50,
                    point: controller.selectedLocation.value!,
                    child: Icon(Icons.location_on, color: Colors.red, size: 40),
                  ),
                ],
              ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.confirmLocation,
        child: Icon(Icons.check),
      ),
    );
  }
}
