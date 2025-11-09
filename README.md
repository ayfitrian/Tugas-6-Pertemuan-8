# H1D023038_Tugas6 - Laporan Praktikum

Proyek ini mendemonstrasikan pembuatan form input data di Flutter dan proses pengiriman (passing) data dari satu halaman (form) ke halaman lainnya (tampilan hasil).

## 🗂️ Dokumen File
<img width="1919" height="999" alt="image" src="https://github.com/user-attachments/assets/0694e36d-59d1-4e10-aa74-15acf47838b3" />
<img width="1917" height="1009" alt="image" src="https://github.com/user-attachments/assets/1a03be26-6d94-4b36-bdb1-309f4e72154c" />
<img width="1919" height="1005" alt="image" src="https://github.com/user-attachments/assets/9d4cce8f-3b36-4a63-b89e-c86382691922" />

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
