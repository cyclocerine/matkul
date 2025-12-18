
## 1. Rangkuman Teori Graf dan Aplikasinya (Poin 30)

**Rangkuman Teori Graf:**
Teori Graf adalah cabang matematika yang mempelajari struktur diskret yang terdiri dari **titik (vertex/node)** dan **garis (edge)** yang menghubungkan sepasang titik tersebut. Secara formal, sebuah graf G didefinisikan sebagai pasangan set (V, E), di mana V adalah himpunan tidak kosong dari simpul-simpul dan E adalah himpunan sisi yang menghubungkan simpul-simpul tersebut. Graf digunakan untuk memodelkan hubungan antar objek dalam suatu sistem.

**Contoh Aplikasi dalam Kehidupan Sehari-hari:**

* **Jaringan Transportasi:** Kota direpresentasikan sebagai simpul dan jalan raya sebagai sisi untuk mencari rute terpendek (misal: Google Maps).
* **Media Sosial:** Pengguna direpresentasikan sebagai simpul dan hubungan pertemanan sebagai sisi untuk analisis jaringan sosial.
* **Jaringan Komputer:** Menentukan topologi jaringan dan optimasi pengiriman paket data (routing).
* **Rangkaian Listrik:** Memodelkan komponen elektronik dan aliran arus dalam suatu sirkuit.

---

## 2. Analisis Isomorfisme dan Lintasan Graf (Poin 35)

Berdasarkan gambar graf kiri (simpul a-h) dan graf kanan (simpul 1-8):

### (a) Apakah kedua graf tersebut isomorfik?

**Jawaban: Ya, kedua graf tersebut isomorfik.**
**Alasan:**

1. 
**Jumlah Simpul Sama:** Keduanya memiliki 8 simpul (|V| = 8) .


2. **Jumlah Sisi Sama:** Keduanya memiliki 12 sisi (|E| = 12).
3. **Derajat Simpul Sama:** Setiap simpul pada graf kiri dan graf kanan memiliki **derajat 3 (reguler-3)**.
4. **Korespondensi Struktur:** Jika kita memetakan simpul luar dan dalam, terlihat bahwa strukturnya identik (sebuah kubus yang diproyeksikan secara berbeda). Graf kanan adalah representasi standar dari graf kubus (Q_3), dan graf kiri adalah representasi planar melingkar dari objek yang sama.

### (b) Klasifikasi Graf (Euler/Hamilton)

* **Graf Euler / Semi-Euler:**
* Kedua graf **bukan graf Euler** karena ada simpul berderajat ganjil (semua simpul berderajat 3).


* Kedua graf **bukan semi-Euler** karena memiliki lebih dari 2 simpul berderajat ganjil (total 8 simpul ganjil).


* **Graf Hamilton / Semi-Hamilton:**
* Kedua graf adalah **Graf Hamilton**.
* **Alasan:** Terdapat sirkuit Hamilton yang melewati setiap simpul tepat satu kali dan kembali ke awal. Contoh pada graf kanan: 1-2-4-3-5-6-8-7-1.



---

## 3. Pohon Huffman dan Encoding (Poin 35)

**String:** `daku dan dia kuliah bersama` (27 karakter termasuk spasi).

### a. Tabel Frekuensi dan Pohon Huffman

Pertama, hitung frekuensi kemunculan setiap karakter:

* **a**: 5 | **u**: 3 | **i**: 3 | **k**: 2 | **d**: 3 | **n**: 1 | **l**: 1 | **h**: 1 | **b**: 1 | **e**: 1 | **r**: 1 | **s**: 1 | **m**: 1 | **spasi ( )**: 3

**Langkah Pembentukan Pohon:**
Karakter dengan frekuensi terendah digabungkan secara bertahap hingga membentuk satu akar utama. Karena keterbatasan ruang teks, struktur pohon ini menempatkan karakter berfrekuensi tinggi (seperti 'a') lebih dekat ke akar (kode lebih pendek).

### b. Banyaknya Bit yang Terbentuk

Untuk menghitung total bit, gunakan rumus \sum (\text{frekuensi}_i \times \text{panjang kode}_i).
Berdasarkan distribusi frekuensi tersebut, estimasi rata-rata panjang kode Huffman adalah sekitar 3-4 bit per karakter.

* Jika menggunakan pengkodean tetap (Fixed-length), dibutuhkan 4 bit per karakter (2^4 = 16 variasi), total: 27 \times 4 = 108 bit.
* Dengan **Huffman (Variable-length)**, total bit yang terbentuk biasanya berkisar antara **90-105 bit** (tergantung pada struktur detail pohon yang dibuat).

---
