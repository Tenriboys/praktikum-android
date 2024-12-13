class Gaji {
  String? nip; // NIK Pegawai
  String? nama; // Nama Pegawai
  String? golongan;
  String? status;
  int masakerja = 0;

  // Metode untuk menghitung tunjangan gaji pokok berdasarkan golongan
  int tunjGapok() {
    int tunjangan = 0;
    if (golongan == "I") {
      tunjangan = 2500000;
    } else if (golongan == "II") {
      tunjangan = 3000000;
    } else if (golongan == "III") {
      tunjangan = 3500000;
    } else if (golongan == "IV") {
      tunjangan = 4000000;
    }
    return tunjangan;
  }

  // Metode untuk menghitung tunjangan berdasarkan status
  int tunjStatus() {
    int tunjangan = 0;

    // Logika tunjangan berdasarkan status menikah atau belum menikah
    if (status == "Menikah") {
      tunjangan += 1000000;
    } else if (status == "Belum Menikah") {
      tunjangan += 500000;
    }

    // Logika tunjangan berdasarkan masa kerja
    if (masakerja > 4) {
      tunjangan += 2000000;
    } else if (masakerja < 4) {
      tunjangan += 1000000;
    }

    return tunjangan;
  }

  // Metode untuk menghitung total gaji
  int totalGaji() {
    return tunjGapok() + tunjStatus();
  }
}
