// Program Aplikasi Sederhana Pemesanan Transportasi Smartride

abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print("ID: $id | Nama: $nama | Tarif dasar: $_tarifDasar | Kapasitas: $kapasitas");
  }
}

// ====== Subclass ======
class Taksi extends Transportasi {
  double jarak;
  Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);

  @override
  double hitungTarif(int jml) => tarifDasar * jarak;
}

class Bus extends Transportasi {
  bool adaWifi;
  Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.adaWifi);

  @override
  double hitungTarif(int jml) => (tarifDasar * jml) + (adaWifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);

  @override
  double hitungTarif(int jml) =>
      tarifDasar * jml * (kelas == "Bisnis" ? 1.5 : 1.0);
}

// ====== Kelas Pemesanan ======

class Pemesanan {
  String idPemesanan, namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi,
      this.jumlahPenumpang, this.totalTarif);

  void cetakStruk() {
    print("=== Struk Pemesanan ===");
    print("Id: $idPemesanan");
    print("Nmama: $namaPelanggan");
    print("Transportasi: ${transportasi.nama}");
    print("Jumlah Penumpang: $jumlahPenumpang");
    print("Total Tarif: Rp${totalTarif.toStringAsFixed(2)}\n");
  }
}

// ====== Fungsi Global ======

Pemesanan buatPemesanan(Transportasi t, String nama, int jml) {
  double total = t.hitungTarif(jml);
  return Pemesanan("P${DateTime.now().millisecondsSinceEpoch}", nama, t, jml, total);

}

void tampilSemua(List<Pemesanan> daftar) {
  for (var p in daftar) {
    p.cetakStruk();
  }
}

// ====== Fungsi Main ======

void main() {
  var taksi = Taksi("T001", "Taksi Online", 3000, 4, 10);
  var bus = Bus("B001", "Bus Kota", 10000, 40, true);
  var pesawat = Pesawat("P001", "Garuda Air", 500000, 100,"Bisnis");

  var daftar = [
    buatPemesanan(taksi, "Lalo", 2),
    buatPemesanan(bus,"Dita", 5),
    buatPemesanan(pesawat, "Delvi", 2),
  ];

  tampilSemua (daftar);
}