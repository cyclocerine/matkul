#include <iostream>
#include <string>
using namespace std;

// Deklarasi fungsi-fungsi
void tampilDaftarWarna();
string cekJenisWarna(int kodeInternal); 
string cekSifatTermal(int kodeInternal); 

void cariWarnaSebelahan(int kodeInternal);
void cariWarnaSeberang(int kodeInternal);
void cariSeberangPisah(int kodeInternal);
void cariWarnaSegitiga(int kodeInternal);
void cariWarnaKotak(int kodeInternal);

int main() {
    int kodeInput;   // Ini yang diinput user (1-12)
    char pilihanPaduan; // Ini yang diinput user (a-e)
    
    // 1. Tampilkan judul dan daftar warna
    cout << "Program Menentukan Notasi, Sifat Warna, dan Perpaduan Warna Harmonis" << endl;
    tampilDaftarWarna();
    
    // 2. Input pertama: Minta kode warna (sesuai kotak merah 1)
    cout << "Pilihan warna nomor : ";
    cin >> kodeInput;
    
    // Validasi input (1-12)
    if(kodeInput < 1 || kodeInput > 12) {
        cout << "\nKode warna tidak valid! Harap masukkan angka 1-12." << endl;
        return 1; // Keluar
    }
    
    // Ubah input user (1-12) menjadi indeks array (0-11)
    int kodeInternal = kodeInput - 1;
    
    // 3. Tampilkan Info Warna (Notasi & Sifat)
    string notasi = cekJenisWarna(kodeInternal);
    string sifat = cekSifatTermal(kodeInternal);
    
    cout << "\nNotasi warna : " << notasi << endl;
    cout << "Sifat warna : " << sifat << endl;
    
    // 4. Tampilkan Menu Harmoni
    cout << "Perpaduan Warna Harmonis" << endl;
    cout << "a. Perpaduan Warna Analogous" << endl;
    cout << "b. Perpaduan Warna Complementary" << endl;
    cout << "c. Perpaduan Warna Split Complementary" << endl;
    cout << "d. Perpaduan Warna Triadic Complementary" << endl;
    cout << "e. Perpaduan Warna Tetrad Complementary" << endl;
    
    // 5. Input kedua: Minta pilihan harmoni (sesuai kotak merah 2)
    cout << "Pilihan : ";
    cin >> pilihanPaduan;
    cout << endl; // Kasih spasi sebelum hasil
    
    // 6. Tampilkan hasil berdasarkan pilihan a-e
    switch(pilihanPaduan) {
        case 'a':
        case 'A':
            cariWarnaSebelahan(kodeInternal);
            break;
        case 'b':
        case 'B':
            cariWarnaSeberang(kodeInternal);
            break;
        case 'c':
        case 'C':
            cariSeberangPisah(kodeInternal);
            break;
        case 'd':
        case 'D':
            cariWarnaSegitiga(kodeInternal);
            break;
        case 'e':
        case 'E':
            cariWarnaKotak(kodeInternal);
            break;
        default:
            cout << "Pilihan tidak valid!" << endl;
    }
    
    return 0; // Program selesai
}

// Tampilan daftar baru, sesuai gambar Anda
void tampilDaftarWarna() {
    cout << "Warna-warna:" << endl;
    cout << " 1. Orange         2. Red-Orange       3. Red" << endl;
    cout << " 4. Red-Violet     5. Violet           6. Blue-Violet" << endl;
    cout << " 7. Blue           8. Blue-Green       9. Green" << endl;
    cout << "10. Yellow-Green   11. Yellow          12. Yellow-Orange" << endl;
}

// Fungsi untuk menentukan Primer, Sekunder, Tersier
// Berdasarkan urutan BARU (1-12)
string cekJenisWarna(int kodeInternal) {
    // Primer (3=Merah, 7=Biru, 11=Kuning)
    // Internal: 2, 6, 10
    if(kodeInternal == 2 || kodeInternal == 6 || kodeInternal == 10) {
        return "Primer";
    }
    // Sekunder (1=Orange, 5=Violet, 9=Green)
    // Internal: 0, 4, 8
    else if(kodeInternal == 0 || kodeInternal == 4 || kodeInternal == 8) {
        return "Sekunder";
    }
    // Sisanya Tersier
    else {
        return "Tersier";
    }
}

// Fungsi BARU untuk menentukan Hangat / Dingin
string cekSifatTermal(int kodeInternal) {
    // Warna Hangat (Warm): 1-4 dan 11-12
    // Internal: 0, 1, 2, 3, 10, 11(index)
    if(kodeInternal <= 3 || (kodeInternal >= 10 && kodeInternal <= 11)) {
        return "Hangat";
    }
    // Warna Dingin (Cool): 5-10
    // Internal: 4, 5, 6, 7, 8, 9
    else {
        return "Dingin";
    }
}

// --- FUNGSI HARMONI (OUTPUT DIUBAH) ---

void cariWarnaSebelahan(int kodeInternal) {
    int kiri_internal = (kodeInternal - 1 + 12) % 12;
    int kanan_internal = (kodeInternal + 1) % 12;
    
    // Output diubah sesuai gambar (tampilkan kode 1-12)
    cout << "Perpaduan Warna Analogous dengan warna nomor :" << endl;
    cout << (kiri_internal + 1) << ", " << (kanan_internal + 1) << endl;
}

void cariWarnaSeberang(int kodeInternal) {
    int komplemen_internal = (kodeInternal + 6) % 12;
    
    cout << "Perpaduan Warna Complementary dengan warna nomor :" << endl;
    cout << (komplemen_internal + 1) << endl;
}

void cariSeberangPisah(int kodeInternal) {
    int komplemen_internal = (kodeInternal + 6) % 12;
    int kiri_internal = (komplemen_internal - 1 + 12) % 12;
    int kanan_internal = (komplemen_internal + 1) % 12;
    
    cout << "Perpaduan Warna Split Complementary dengan warna nomor :" << endl;
    cout << (kiri_internal + 1) << ", " << (kanan_internal + 1) << endl;
}

void cariWarnaSegitiga(int kodeInternal) {
    int warna2_internal = (kodeInternal + 4) % 12;
    int warna3_internal = (kodeInternal + 8) % 12;
    
    cout << "Perpaduan Warna Triadic Complementary dengan warna nomor :" << endl;
    cout << (warna2_internal + 1) << ", " << (warna3_internal + 1) << endl;
}

void cariWarnaKotak(int kodeInternal) {
    int warna2_internal = (kodeInternal + 3) % 12;
    int warna3_internal = (kodeInternal + 6) % 12;
    int warna4_internal = (kodeInternal + 9) % 12;
    
    cout << "Perpaduan Warna Tetrad Complementary dengan warna nomor :" << endl;
    cout << (warna2_internal + 1) << ", " << (warna3_internal + 1) << ", " << (warna4_internal + 1) << endl;
}
