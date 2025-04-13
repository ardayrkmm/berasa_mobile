class Galerigambarmakanan {
  String url;

  Galerigambarmakanan({required this.url});

  // Konversi dari JSON ke Model
  factory Galerigambarmakanan.fromJson(Map<String, dynamic> json) {
    return Galerigambarmakanan(url: json["url"]);
  }

  Map<String, dynamic> toJson() {
    return {"url": url};
  }
}
