import 'package:flutter/material.dart';

class Studikasus01 extends StatefulWidget {
  const Studikasus01({super.key});
  @override
  _Studikasus01State createState() => _Studikasus01State();
}

class _Studikasus01State extends State<Studikasus01> {
  final TextEditingController _nilaiController1 = TextEditingController();
  final TextEditingController _nilaiController2 = TextEditingController();
  bool _tambahChecked = false;
  bool _kurangChecked = false;
  String _result = ''; // Menyimpan hasil operasi
  void _hitung() {
// Mengambil input dari TextEditingControllers
    double? nilai1 = double.tryParse(_nilaiController1.text);
    double? nilai2 = double.tryParse(_nilaiController2.text);
// Memeriksa apakah input valid
    if (nilai1 != null && nilai2 != null) {
      setState(() {
        _result = ''; // Mengosongkan hasil sebelumnya
// Melakukan operasi berdasarkan pilihan checkbox
        if (_tambahChecked) {
          _result += 'Hasil Penjumlahan: ${nilai1 + nilai2}\n';
        }
        if (_kurangChecked) {
          _result += 'Hasil Pengurangan: ${nilai1 - nilai2}\n';
        }
        if (!_tambahChecked && !_kurangChecked) {
          _result = 'Silakan pilih operasi.';
        }
      });
    } else {
      setState(() {
        _result = 'Input tidak valid. Mohon masukkan angka.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Operasi Matematika')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
// Input angka pertama
            TextField(
              controller: _nilaiController1,
              decoration: InputDecoration(labelText: 'Masukkan Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
// Input angka kedua
            TextField(
              controller: _nilaiController2,
              decoration: InputDecoration(labelText: 'Masukkan Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
// Checkbox untuk Penjumlahan
            CheckboxListTile(
              title: Text('Hitung Penjumlahan'),
              value: _tambahChecked,
              onChanged: (bool? value) {
                setState(() {
                  _tambahChecked = value ?? false;
                });
              },
            ),
// Checkbox untuk Pengurangan
            CheckboxListTile(
              title: Text('Hitung Pengurangan'),
              value: _kurangChecked,
              onChanged: (bool? value) {
                setState(() {
                  _kurangChecked = value ?? false;
                });
              },
            ),
// Tombol untuk menghitung
            ElevatedButton(
              onPressed: _hitung,
              child: Text('Hitung'),
            ),
// Menampilkan hasil
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _result,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
