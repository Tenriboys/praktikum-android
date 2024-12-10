import 'package:flutter/material.dart';

class Checkbox02 extends StatefulWidget {
  const Checkbox02({super.key});
  @override
  _Checkbox02State createState() => _Checkbox02State();
}

class _Checkbox02State extends State<Checkbox02> {
  // Daftar hobi
  final List<String> _hobbies = [
    "Bermain Musik",
    "Olahraga",
    "Membaca",
    "Memasak"
  ];

  // Menyimpan status checkbox untuk setiap hobi
  final Map<String, bool> _hobbySelections = {
    "Bermain Musik": false,
    "Olahraga": false,
    "Membaca": false,
    "Memasak": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Hobi')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Menampilkan checkbox untuk setiap hobi
            ..._hobbies.map((hobi) {
              return CheckboxListTile(
                title: Text(hobi),
                value: _hobbySelections[hobi],
                onChanged: (bool? value) {
                  setState(() {
                    _hobbySelections[hobi] =
                        value ?? false; //Memperbarui status hobi
                  });
                },
              );
            }).toList(),

            // Menampilkan hobi yang dipilih
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Hobi yang dipilih: ${_hobbySelections.entries.where((entry) => entry.value).map((entry) => entry.key).join(',')}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
