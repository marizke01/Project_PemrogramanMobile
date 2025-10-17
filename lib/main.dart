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

// HALAMAN UTAMA CATATAN

class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  // Controller untuk input judul dan isi catatan
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // List untuk menyimpan semua catatan
  final List<Map<String, String>> _notes = [];

  // Fungsi untuk menambah catatan baru
  void _addNote() {
    // Jika kedua field kosong, tidak disimpan
    if (_titleController.text.isEmpty && _contentController.text.isEmpty) return;

    setState(() {
      // Tambahkan catatan baru ke list
      _notes.add({
        'title': _titleController.text,
        'content': _contentController.text,
      });
    });

    // Kosongkan textfield
    _titleController.clear();
    _contentController.clear();

    // Tutup dialog
    Navigator.pop(context);
  }

  // Fungsi untuk menampilkan dialog tambah catatan
  void _showAddNoteDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Bisa ditutup dengan tap di luar dialog
      barrierLabel: "Tambah Catatan",
      barrierColor: Colors.black45, // Warna bayangan di belakang dialog
      transitionDuration: const Duration(milliseconds: 300), // Durasi animasi
      pageBuilder: (context, animation, secondaryAnimation) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6), // Efek blur latar belakang
          child: Center(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8F0),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Judul dialog
                    const Text(
                      "Tambah Catatan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5C4033),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Input judul catatan
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Judul",
                        filled: true,
                        fillColor: const Color(0xFFFFF5E4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Input isi catatan
                    TextField(
                      controller: _contentController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Isi Catatan",
                        filled: true,
                        fillColor: const Color(0xFFFFF5E4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tombol Simpan
                    ElevatedButton(
                      onPressed: _addNote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB29470),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

      // Efek animasi munculnya dialog
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: child,
          ),
        );
      },
    );
  }
}