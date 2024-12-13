import 'package:flutter/material.dart';

class Tampil extends StatelessWidget {
  final String nip;
  final String nama;
  final String golongan;
  final String status;
  final int masaKerja;
  final int totalGaji;

  const Tampil({
    super.key,
    required this.nip,
    required this.nama,
    required this.golongan,
    required this.status,
    required this.masaKerja,
    required this.totalGaji,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: $nip', style: TextStyle(fontSize: 18)),
            Text('Nama: $nama', style: TextStyle(fontSize: 18)),
            Text('Golongan: $golongan', style: TextStyle(fontSize: 18)),
            Text('Status: $status', style: TextStyle(fontSize: 18)),
            Text('Masa Kerja: $masaKerja tahun',
                style: TextStyle(fontSize: 18)),
            Text('Total Gaji: Rp$totalGaji',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
