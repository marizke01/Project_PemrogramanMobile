# Simplenote

## Identitas Tim
**Anggota Kelompok:**
- Alifa Nur Azizah - 2310120002
- Tiara Widya - 2310120013
- Marizke Mega Utami - 2310120023

## Tema Aplikasi
**Aplikasi Catatan Sederhana** - Sebuah aplikasi mobile untuk mencatat dan mengelola catatan harian dengan antarmuka yang user-friendly.

## Deskripsi Fitur
Aplikasi Simple Notes memungkinkan pengguna untuk:
- ✨ Membuat catatan baru dengan judul dan konten
- 👀 Melihat daftar semua catatan yang tersimpan
- 🗑️ Menghapus catatan yang tidak diperlukan
- 🎨 Antarmuka yang elegan dengan tema warna earth tone
- ⚡ Animasi smooth untuk pengalaman pengguna yang baik

## Pembagian Tugas
- Alifa Nur Azizah    : Struktur aplikasi
- Tiara Widya         : design aplikasi
- Marizke Mega Utami  : list implementation

## Screenshot Aplikasi

### Tampilan Form Input

### Tampilan Daftar Catatan

## Penggunaan List untuk Menyimpan Data

final List<Map<String, String>> _notes = [];

List digunakan sebagai wadah untuk menyimpan multiple catatan. Map<String, String> setiap catatan disimpan sebagai Map dengan key-value pairs. _notes adalah variabel yang menampung semua data catatan.

Method add() digunakan untuk menambahkan catatan baru. Setiap catatan memiliki struktur:
{
  'title': 'Judul Catatan',
  'content': 'Isi catatan...'
}

Data diakses menggunakan index _notes[index]. Kemudian menampilkan data dari list menggunakan itemCount: _notes.length - Menentukan berapa banyak item yang akan ditampilkan. ListView.builder secara efisien hanya merender item yang terlihat di layar.

Menghapus data menggunakan removeAt(index) menghapus catatan pada posisi tertentu dan Operasi ini langsung mempengaruhi list asli.

