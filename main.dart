import 'package:flutter/material.dart';
import 'package:praktikum03/studikasus03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum03',
      home: StudiKasus03(), // Corrected class name to match the file name
    );
  }
}
