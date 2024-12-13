import 'package:flutter/material.dart';
import 'package:praktikum04/tampil.dart';
import 'gaji.dart';

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String? _nip;
  String? _nama;
  String? _pilihanGolongan;
  String? _pilihanStatus;
  int _masakerja = 0;

  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();

  var salary = Gaji(); // Objek salary untuk menghitung gaji

  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  @override
  void dispose() {
    nipController.dispose(); // Bersihkan controller saat widget dihapus
    namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input NIP
            TextField(
              controller: nipController,
              decoration: const InputDecoration(labelText: 'NIP Pegawai'),
              onChanged: (value) {
                setState(() {
                  _nip = value;
                });
              },
            ),
            // Input Nama
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Pegawai'),
              onChanged: (value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            // Dropdown Golongan
            DropdownButton<String>(
              hint: const Text('Golongan Pegawai'),
              value: _pilihanGolongan,
              onChanged: (String? value) {
                setState(() {
                  _pilihanGolongan = value;
                  salary.golongan = value; // Memasukkan ke objek salary
                });
              },
              items: golongan.map<DropdownMenuItem<String>>(
                (String gol) {
                  return DropdownMenuItem<String>(
                    value: gol,
                    child: Text(gol),
                  );
                },
              ).toList(),
            ),
            // Dropdown Status
            DropdownButton<String>(
              hint: const Text('Status Pegawai'),
              value: _pilihanStatus,
              onChanged: (String? value) {
                setState(() {
                  _pilihanStatus = value;
                  salary.status = value; // Memasukkan ke objek salary
                });
              },
              items: status.map<DropdownMenuItem<String>>(
                (String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                },
              ).toList(),
            ),
            // Input Masa Kerja
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Masa Kerja (tahun)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  // Validasi input masa kerja (harus berupa angka)
                  _masakerja = int.tryParse(value) ?? 0;
                  salary.masakerja = _masakerja; // Memasukkan ke objek salary
                });
              },
            ),
            // Tombol Hitung Gaji
            ElevatedButton(
              onPressed: () {
                if (_nip != null &&
                    _nama != null &&
                    _pilihanGolongan != null &&
                    _pilihanStatus != null &&
                    _masakerja > 0) {
                  // Menampilkan hasil di Tampil.dart (Dialog)
                  int totalGaji = salary.totalGaji();

                  // Navigasi ke halaman baru untuk menampilkan hasil gaji
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tampil(
                        nip: _nip!,
                        nama: _nama!,
                        golongan: salary.golongan!,
                        status: salary.status!,
                        masaKerja: salary.masakerja,
                        totalGaji: totalGaji,
                      ),
                    ),
                  );
                } else {
                  // Jika ada field yang belum diisi atau masa kerja 0
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap lengkapi semua data!')),
                  );
                }
              },
              child: const Text('Hitung Gaji'),
            ),
          ],
        ),
      ),
    );
  }
}
