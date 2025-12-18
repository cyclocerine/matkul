# Matkul Repository

Repository ini berisi kumpulan kode program untuk mata kuliah pemrograman, termasuk praktikum, proyek, dan eksperimen.

---

## Struktur Direktori

```
cpp_matkul/
├── catatan/              # Dokumentasi dan catatan
├── database/             # File database
│   ├── sql/              # Script SQL
│   └── normalisasi/      # File Excel normalisasi
├── eksperimen/           # Kode eksperimen
│   ├── cuda/             # Program CUDA
│   └── python/           # Script Python
├── praktikum/            # Tugas praktikum algoritma
│   ├── tugas/            # Tugas resmi
│   └── latihan/          # Latihan mandiri
└── proyek/               # Proyek-proyek C++
```

---

## Deskripsi Folder

### catatan/
Berisi catatan dan dokumentasi dalam format Markdown:
- `faiq.md` - Catatan pribadi
- `matdis.md` - Catatan Matematika Diskrit

### database/
Berisi file-file terkait basis data:
- **sql/** - Script SQL untuk berbagai database (HRD, perpustakaan, rumah sakit)
- **normalisasi/** - File Excel hasil normalisasi database RS Pikes

### eksperimen/
Berisi kode eksperimen di luar kurikulum:
- **cuda/** - Program parallel computing menggunakan CUDA (bigint, permutasi, perhitungan pi)
- **python/** - Script Python untuk berbagai keperluan

### praktikum/
Berisi file praktikum algoritma dan pemrograman:
- **tugas/** - Tugas resmi dengan format penamaan `NIM_Nama_NamaTugas.cpp`
- **latihan/** - Kode latihan seperti array, perpustakaan, parkir, dan lainnya

### proyek/
Berisi proyek-proyek C++ yang lebih terstruktur:
- Project1 sampai Project15 dengan topik yang berbeda
- Dilengkapi `Makefile` untuk kompilasi
- Header file pendukung (`count.h`)

---

## Cara Kompilasi

### C++ (Linux/macOS)
```bash
g++ -o output nama_file.cpp
```

### C++ (Windows)
```cmd
g++ -o output.exe nama_file.cpp
```

### CUDA (.cu)
Memerlukan NVIDIA CUDA Toolkit yang sudah terinstall.

```bash
# Kompilasi dasar
nvcc -o output nama_file.cu

# Dengan optimasi
nvcc -O2 -o output nama_file.cu

# Menentukan arsitektur GPU (contoh: compute capability 7.5)
nvcc -arch=sm_75 -o output nama_file.cu
```

Untuk mengecek apakah CUDA sudah terinstall:
```bash
nvcc --version
```

### Menggunakan Makefile (folder proyek/)
```bash
cd proyek
make
```

---

## Author

Faiq - 123250016

Informatika - UPN Veteran Yogyakarta
