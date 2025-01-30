import 'dart:io';

// Map kosong untuk menyimpan data mobil
Map<String, int> dataMobil = {};

void main() {
  while (true) {
    tampilkanMenu();
    // Meminta input dari user
    String? input = stdin.readLineSync();

    // Melakukan validasi supaya input yang dimasukkan berupa number
    int inputNumber;
    try {
      inputNumber = int.parse(input!);
    } on Exception {
      print("Input harus berupa Angka! Silahkan coba lagi.");
      continue;
    }

    switch (inputNumber) {
      case 1:
        tambahMobil();
        break;
      case 2:
        hapusMobil();
        break;
      case 3:
        editMobil();
        break;
      case 4:
        tampilkanDaftarMobil();
        break;
      case 5:
        print("Keluar dari sistem..");
        return;
      default:
        print("Pilihan tidak valid! Silahkan coba lagi.");
    }
  }
}

// Unit Method: mengubah string ke int untuk memastikan input yang dimasukkan adalah number
int? parseToInt(String variable) {
  try {
    return int.parse(variable);
  } on FormatException {
    print("Input harus berupa angka! Silahkan coba lagi");
    return null;
  }
}

// Unit Method: Membersihkan konsol
void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}

// Menampilkan Menu
void tampilkanMenu() {
  print("=== Menu Rental Mobil ===\n"
      "1. Tambah Mobil\n"
      "2. Hapus Mobil\n"
      "3. Edit Data Mobil\n"
      "4. Tampilkan Daftar Mobil\n"
      "5. Keluar\n"
      "Silahkan Pilih menu (1-5): ");
}

// Menambahkan Mobil
void tambahMobil() {
  clearConsole();
  print("=== Tambah Mobil ===\n"
      "Masukkan nama mobil: ");
  String? mobil = stdin.readLineSync();

  print("Masukkan harga mobil: ");
  String? inputHarga = stdin.readLineSync();
  int? harga = parseToInt(inputHarga!);

  if (harga == null) {
    clearConsole();
    print("Input harus berupa angka! Silahkan coba lagi");
    return;
  }

  clearConsole();
  dataMobil[mobil!] = harga;
  print("Mobil $mobil dengan harga Rp $harga berhasil ditambahkan.");
}

void hapusMobil() {
  clearConsole();
  if (dataMobil.isEmpty) {
    print("Tidak ada mobil yang tersedia.");
    return;
  }

  print("=== Hapus Mobil ===\n");
  tampilkanDaftarMobil();
  print("Masukkan nama mobil yang ingin dihapus: ");
  String? mobil = stdin.readLineSync();

  if (!dataMobil.containsKey(mobil)) {
    clearConsole();
    print("Mobil $mobil tidak ditemukan.");
    return;
  }
  dataMobil.remove(mobil);
  clearConsole();
  print("Mobil $mobil berhasil dihapus.");
}

// Fungsi untuk mengedit data mobil
void editMobil() {
  clearConsole();
  if (dataMobil.isEmpty) {
    print("Tidak ada mobil yang tersedia.");
    return;
  }

  print("\n=== Edit Data Mobil ===");

  tampilkanDaftarMobil();
  print("Masukkan nama mobil yang ingin diubah:");
  String? mobil = stdin.readLineSync();

  if (!dataMobil.containsKey(mobil)) {
    clearConsole();
    print("Mobil $mobil tidak ditemukan.");
    return;
  }

  print("Masukkan harga baru untuk mobil $mobil:");
  String? hargaInput = stdin.readLineSync();

  // Validasi input harga harus angka menggunakan exception handling
  int? hargaBaru = parseToInt(hargaInput!);
  dataMobil[mobil!] = hargaBaru!; // Mengupdate harga mobil
  clearConsole();
  print("Harga mobil $mobil berhasil diubah menjadi Rp$hargaBaru.");
}

void tampilkanDaftarMobil() {
  clearConsole();
  if (dataMobil.isEmpty) {
    print("Tidak ada mobil yang tersedia.");
    return;
  }

  dataMobil.forEach((nama, harga) {
    print("$nama\t|\tRp$harga");
  });
}
