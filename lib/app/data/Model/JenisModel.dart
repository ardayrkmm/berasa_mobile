class Jenismodel {
  final String id;
  final String nama;

  Jenismodel({required this.id, required this.nama});

  factory Jenismodel.fromJson(Map<String, dynamic> json) {
    return Jenismodel(id: json['id_jenis'], nama: json['nama_jenis']);
  }
}
