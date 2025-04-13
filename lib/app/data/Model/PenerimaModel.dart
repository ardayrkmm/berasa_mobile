class PenerimaModel {
  final String id;
  final String nama;
  final String deskripsi;
  final String alamat;
  final double latitude;
  final double longtitude;

  PenerimaModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.alamat,
    required this.latitude,
    required this.longtitude,
  });

  factory PenerimaModel.fromJson(Map<String, dynamic> json) {
    return PenerimaModel(
      id: json['id_penerima'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      alamat: json['alamat'],
      latitude: double.parse(json['latitude'].toString()),
      longtitude: double.parse(json['longtitude'].toString()),
    );
  }
}
