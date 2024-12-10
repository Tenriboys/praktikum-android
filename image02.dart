import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/gambar1.jpg'), // Gambar 1
            Image.asset('assets/gambar2.jpg'), // Gambar 2
            Image.asset('assets/gambar3.jpg'), // Gambar 3
            Image.asset('assets/gambar4.jpg'), // Gambar 4
            Image.asset('assets/gambar5.jpg'), // Gambar 5
          ],
        ),
      ),
    );
  }
}
