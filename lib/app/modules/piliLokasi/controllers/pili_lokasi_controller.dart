import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class PiliLokasiController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var locationEnabled = false.obs;
  var selectedLocation = Rxn<LatLng>();

  Future<void> getCurrentLocation() async {
    bool cekService = await Geolocator.isLocationServiceEnabled();
    if (!cekService) {
      locationEnabled.value = false;
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latitude.value = position.latitude;
    longitude.value = position.longitude;
    locationEnabled.value = true;
    selectedLocation.value = LatLng(position.latitude, position.longitude);
  }

  void updateSelectedLocation(LatLng position) {
    selectedLocation.value = position;
  }

  void confirmLocation() {
    if (selectedLocation.value != null) {
      Get.back(result: selectedLocation.value);
    }
  }
}
