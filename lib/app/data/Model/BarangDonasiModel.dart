import 'package:berasa_mobile/app/data/Model/GaleriGambarMakanan.dart';

class BarangDonasiModel {
  String namaMakanan;
  String deksripsi;
  String batasKonsumsi;
  int jumlahPorsi;
  String idJenis;
  List<Galerigambarmakanan> galeriMakanan;
  BarangDonasiModel({
    required this.namaMakanan,
    required this.idJenis,
    required this.jumlahPorsi,
    required this.deksripsi,
    required this.batasKonsumsi,
    required this.galeriMakanan,
  });

  factory BarangDonasiModel.fromJson(Map<String, dynamic> json) {
    return BarangDonasiModel(
      namaMakanan: json["nama_makanan"],
      idJenis: json["id_jenis"],
      jumlahPorsi: json["jumlah_porsi"],
      deksripsi: json["deskripsi"],
      batasKonsumsi: json["batas_waktu_konsumsi"],
      galeriMakanan:
          (json["galeri_makanan"] as List<dynamic>)
              .map((item) => Galerigambarmakanan(url: item.toString()))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama_makanan": namaMakanan,
      "id_jenis": idJenis,
      "jumlah_porsi": jumlahPorsi,
      "deskripsi": deksripsi,
      "batas_waktu_konsumsi": batasKonsumsi,
    };
  }
}
