import 'package:berasa_mobile/app/data/Model/BarangDonasiModel.dart';

class DonasiModel {
  String nama;
  String alamat;
  String deskripsi;
  String longitude;
  String latitude;
  final String? tanggal;
  List<BarangDonasiModel> barangDonasi;
  DonasiModel({
    required this.nama,
    required this.alamat,
    required this.barangDonasi,
    required this.deskripsi,
    required this.latitude,
    this.tanggal,
    required this.longitude,
  });
  factory DonasiModel.fromJson(Map<String, dynamic> json) {
    return DonasiModel(
      nama: json["nama"],
      deskripsi: json["deskripsi"],
      alamat: json["alamat"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      tanggal: json["tanggal"],
      barangDonasi:
          (json["barang_donasi"] as List)
              .map((item) => BarangDonasiModel.fromJson(item))
              .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "nama": nama,
      "deskripsi": deskripsi,
      "alamat": alamat,
      "latitude": latitude,
      "longitude": longitude,
      "tanggal": tanggal,
      "barang_donasi": barangDonasi.map((b) => b.toJson()).toList(),
    };
  }
}
