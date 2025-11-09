# H1D023038_Tugas6 - Laporan Praktikum

Proyek ini mendemonstrasikan pembuatan form input data di Flutter dan proses pengiriman (passing) data dari satu halaman (form) ke halaman lainnya (tampilan hasil).

## 🗂️ Dokumen File
<img width="1916" height="1007" alt="Screenshot 2025-11-09 233444" src="https://github.com/user-attachments/assets/2a2d2c9a-5087-4b40-9a97-2fdfa0aac580" />

## 🗂️ Struktur File

* `lib/ui/form_data.dart`: Halaman stateful widget yang berisi form input (Nama, NIM, Tahun Lahir).
* `lib/ui/tampil_data.dart`: Halaman stateless widget yang menerima dan menampilkan data dari form.
* `lib/main.dart`: File utama untuk menjalankan aplikasi, dengan `FormData` sebagai halaman `home`.

## ⚙️ Penjelasan Proses Passing Data

Proses pengiriman data dari `form_data.dart` ke `tampil_data.dart` dilakukan menggunakan metode **Constructor Parameter** yang dikombinasikan dengan `Navigator.push`.

Berikut adalah langkah-langkah detailnya:

### 1. Pengumpulan Data di Halaman Form (`form_data.dart`)

* Setiap `TextField` pada form (Nama, NIM, Tahun Lahir) dihubungkan ke sebuah `TextEditingController` (misal: `_namaController`, `_nimController`).
* Controller ini bertugas untuk menyimpan dan mengelola teks yang diinput oleh pengguna.

### 2. Aksi Tombol "Simpan"

* Ketika tombol "Simpan" ditekan, fungsi `_kirimData()` dipanggil.
* Di dalam fungsi ini, data diambil dari controller menggunakan properti `.text` (contoh: `String nama = _namaController.text;`).
* Untuk data "Tahun Lahir", data teks dikonversi menjadi `int` (angka) dan kemudian digunakan untuk menghitung umur.

### 3. Pengiriman Data via `Navigator.push`

* Data yang sudah terkumpul (nama, nim, dan umur) siap untuk dikirim.
* Proses pengiriman ini terjadi saat perpindahan halaman menggunakan `Navigator.push`.
* Saat memanggil `MaterialPageRoute`, kita tidak hanya memanggil halaman `TampilData` secara kosong, tetapi kita **membuat instance (objek) baru** dari `TampilData` dan **menyertakan data tersebut sebagai argumen di dalam constructor-nya**.

```dart
// Potongan kode di form_data.dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TampilData( // <-- Panggil TampilData
      nama: nama,     // <-- Kirim data 'nama'
      nim: nim,       // <-- Kirim data 'nim'
      umur: umur,     // <-- Kirim data 'umur'
    ),
  ),
);
