import 'package:flutter/material.dart';

class Combobox01 extends StatefulWidget {
  const Combobox01({super.key});

  @override
  _Combobox01State createState() => _Combobox01State();
}

class _Combobox01State extends State<Combobox01> {
  String? itemPilihan; // Variabel untuk menyimpan item yang terpilih
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4']; // Daftar item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Combobox'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menambahkan centering
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Item'),
              value: itemPilihan,
              onChanged: (String? pilihannya) {
                setState(() {
                  itemPilihan = pilihannya; // Set item yang dipilih
                });
              },
              items: items.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // Menambahkan jarak antar widget
            Text(
              'Pilihan: ${itemPilihan ?? "Belum ada"}', // Menghindari null
              style: const TextStyle(fontSize: 24), // Ukuran font disesuaikan
            ),
          ],
        ),
      ),
    );
  }
}