import 'dart:io';

void main() {
  bool jalan = true;

  while (jalan) {
    print("APLIKASI RESTORAN SEDERHANA");

    // Menu makanan
    print("\nMenu Makanan:");
    print("1. Nasi Goreng - Rp20000");
    print("2. Mie Ayam    - Rp15000");
    print("3. Ayam Bakar  - Rp25000");

    stdout.write("Pilih makanan (1-3): ");
    int pilihMakanan = int.parse(stdin.readLineSync()!);

    String namaMakanan = "";
    int hargaMakanan = 0;

    if (pilihMakanan == 1) {
      namaMakanan = "Nasi Goreng";
      hargaMakanan = 20000;
    } else if (pilihMakanan == 2) {
      namaMakanan = "Mie Ayam";
      hargaMakanan = 15000;
    } else if (pilihMakanan == 3) {
      namaMakanan = "Ayam Bakar";
      hargaMakanan = 25000;
    } else {
      print("Pilihan tidak valid!");
      continue;
    }

    // Menu minuman
    print("\nMenu Minuman:");
    print("1. Es Teh    - Rp5000");
    print("2. Es Jeruk  - Rp7000");
    print("3. Kopi      - Rp10000");

    stdout.write("Pilih minuman (1-3): ");
    int pilihMinuman = int.parse(stdin.readLineSync()!);

    String namaMinuman = "";
    int hargaMinuman = 0;

    if (pilihMinuman == 1) {
      namaMinuman = "Es Teh";
      hargaMinuman = 5000;
    } else if (pilihMinuman == 2) {
      namaMinuman = "Es Jeruk";
      hargaMinuman = 7000;
    } else if (pilihMinuman == 3) {
      namaMinuman = "Kopi";
      hargaMinuman = 10000;
    } else {
      print("Pilihan tidak valid!");
      continue;
    }

    // Hitung total
    int total = hargaMakanan + hargaMinuman;
    print("\nPesanan Anda: $namaMakanan + $namaMinuman");
    print("Total harga: Rp$total");

    // Pembayaran
    stdout.write("Masukkan uang pembayaran: Rp");
    int bayar = int.parse(stdin.readLineSync()!);

    if (bayar < total) {
      print("Uang tidak cukup, pesanan dibatalkan!\n");
      continue;
    }

    int kembalian = bayar - total;
    print("Pembayaran berhasil! Kembalian Anda: Rp$kembalian\n");

    // lanjut atau keluar
    stdout.write("Mau pesan lagi? (y/n): ");
    String lagi = stdin.readLineSync()!;
    if (lagi.toLowerCase() != "y") {
      jalan = false;
      print("\nTerima kasih sudah makan di Restoran kami!");
    }
  }
}
