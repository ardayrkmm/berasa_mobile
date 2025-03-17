class Usermodel {
  String id;
  String nama;
  String email;
  String nomer_telepon;
  String alamat;
  double poin;
  String img_profil;
  bool isVerified;

  Usermodel({
    required this.id,
    required this.nama,
    required this.email,
    required this.nomer_telepon,
    required this.alamat,
    required this.poin,
    required this.img_profil,
    required this.isVerified,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json['id'] ?? "", // Jika null, ganti dengan string kosong
      nama: json['nama'] ?? "",
      email: json['email'] ?? "",
      nomer_telepon: json['nomer_telepon'] ?? "",
      alamat: json['alamat'] ?? "",
      poin:
          (json['poin'] as num?)?.toDouble() ??
          0.0, // Ubah ke double, default 0.0 jika null
      img_profil: json['img_profil'] ?? "default.png",
      isVerified: json['is_verified'] ?? false, // Default false jika null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "email": email,
      "nomer_telepon": nomer_telepon,
      "alamat": alamat,
      "poin": poin,
      "img_profil": img_profil,
      "is_verified": isVerified,
    };
  }
}
