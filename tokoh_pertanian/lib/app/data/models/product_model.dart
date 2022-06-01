class Product {
  String? id;
  String? nama;
  String? harga;
  String? tokoh;
  String? lokasi;
  String? alamat;
  String? gambar;

  Product(
      {this.id,
      this.nama,
      this.harga,
      this.tokoh,
      this.lokasi,
      this.alamat,
      this.gambar});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    harga = json['harga'];
    tokoh = json['tokoh'];
    lokasi = json['lokasi'];
    alamat = json['alamat'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['harga'] = harga;
    data['tokoh'] = tokoh;
    data['lokasi'] = lokasi;
    data['alamat'] = alamat;
    data['gambar'] = gambar;
    return data;
  }
}
