import 'dart:ui'; // Untuk efek blur pada dialog
import 'package:flutter/material.dart'; // Paket utama Flutter untuk UI

void main() {
  runApp(const SimpleNotesApp()); // Menjalankan aplikasi utama
}

// APLIKASI UTAMA
class SimpleNotesApp extends StatelessWidget {
  const SimpleNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        // Tema aplikasi
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD2B48C),
          primary: const Color(0xFFB29470),
          secondary: const Color(0xFFF5E6CC),
        ),
        useMaterial3: true, // Menggunakan desain Material 3
        fontFamily: 'Poppins', // Font utama
      ),
      home: const NotesHome(), // Halaman utama
    );
  }
}
