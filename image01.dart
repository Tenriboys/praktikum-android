import 'package:flutter/material.dart';

class Image01 extends StatelessWidget {
  const Image01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: Center(
        child: Image.asset(
          'assets/gambar1.jpg', // Ganti dengan nama gambar yang sesuai
        ),
      ),
    );
  }
}
