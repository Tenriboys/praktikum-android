import 'package:flutter/material.dart';

class Combobox03 extends StatefulWidget {
  const Combobox03({super.key});

  @override
  _Combobox03State createState() => _Combobox03State();
}

class _Combobox03State extends State<Combobox03> {
  String? selectedItem; // Variabel untuk menyimpan item yang terpilih

  final List<Map<String, dynamic>> items = [
    {'value': 'Rumah', 'icon': Icons.home},
    {'value': 'Bintang', 'icon': Icons.star},
    {'value': 'Pengaturan', 'icon': Icons.settings},
    {'value': 'Pengguna', 'icon': Icons.person},
  ]; // Daftar item dengan ikon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComboBox dan Icon'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedItem,
          hint: const Text('Pilih Item'),
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue; // Set item yang dipilih
            });
          },
          items:
              items.map<DropdownMenuItem<String>>((Map<String, dynamic> item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Row(
                children: [
                  Icon(item['icon']),
                  const SizedBox(
                      width: 8), // Memberikan jarak antara ikon dan teks
                  Text(item['value']),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
