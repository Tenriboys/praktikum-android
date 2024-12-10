import 'package:flutter/material.dart';

class Radiobutton01 extends StatefulWidget {
  const Radiobutton01({super.key});

  @override
  _Radiobutton01State createState() => _Radiobutton01State();
}

class _Radiobutton01State extends State<Radiobutton01> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';
  String _selectedGender = ''; // Variabel untuk menyimpan pilihan radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Input dengan Radio Button')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Nama'),
              onChanged: (value) {
                setState(() {
                  _name = value; // Memperbarui state saat input berubah
                });
              },
            ),
            SizedBox(height: 16), // Memberikan jarak antara TextField dan Text
            Text(
              'Nama: $_name',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Pilih Jenis Kelamin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: Text('Laki-Laki'),
              value: 'Laki-Laki',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Perempuan'),
              value: 'Perempuan',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Jenis Kelamin: $_selectedGender',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
