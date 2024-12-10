import 'package:flutter/material.dart';

class Combobox02 extends StatefulWidget {
  const Combobox02({super.key});

  @override
  _Combobox02State createState() => _Combobox02State();
}

class _Combobox02State extends State<Combobox02> {
  String? pilihKategori; // Variabel untuk menyimpan kategori yang terpilih
  String? pilihItem; // Variabel untuk menyimpan item yang terpilih

  // Data untuk ComboBox Pertama
  final List<String> categories = ['Buah', 'Sayur'];

  // Data untuk ComboBox Kedua tergantung kategori
  final Map<String, List<String>> items = {
    'Buah': ['Apel', 'Pisang', 'Jeruk'],
    'Sayur': ['Wortel', 'Bayam', 'Kangkung'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combobox Bersarang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: pilihKategori,
              hint: const Text('Pilih Kategori'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihKategori = newValue; // Set kategori yang dipilih
                  pilihItem = null; // Reset item saat kategori berubah
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // Menambahkan jarak antar dropdown
            DropdownButton<String>(
              value: pilihItem,
              hint: const Text('Pilih Item'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihItem = newValue; // Set item yang dipilih
                });
              },
              items: pilihKategori != null
                  ? items[pilihKategori!]!
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  : [], // Tampilkan item sesuai kategori yang dipilih
            ),
          ],
        ),
      ),
    );
  }
}
