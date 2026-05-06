#include <iostream>
#include <iomanip>
using namespace std;

// Kelas A
// 123250033, Devana Shifa
// 123250016, Faiq Hammam Mutaqin
// 

struct Mahasiswa {
    int nim;
    string kelas;
    float ipk;
};

Mahasiswa mhs[10];
int n = 0;

void inputData() {
    cout << "INPUT DATA" << endl;
    cout << "==============================" << endl;
    cout << "Jumlah Data (max 10) : ";
    cin >> n;
    cout << endl;

    if (n > 10) {
        cout << "Maksimal hanya 10 data!" << endl;
        n = 0; // Reset n biar aman
        return;
    }

    for (int i = 0; i < n; i++) {
        cout << "Data ke-" << i + 1 << endl;
        cout << "NIM    : "; cin >> mhs[i].nim;
        cout << "Kelas  : "; cin >> mhs[i].kelas;
        cout << "IPK    : "; cin >> mhs[i].ipk;
        cout << "==============================" << endl;
    }
}

void tampilData() {
    if (n == 0) {
        cout << "Data belum tersedia!" << endl << endl;
        return;
    }
    cout << "TAMPIL DATA" << endl;
    cout << "==============================" << endl;
    cout << left
         << setw(15) << "NIM"
         << setw(10) << "KELAS"
         << setw(10) << "IPK" << endl;
    cout << "==============================" << endl;
    for (int i = 0; i < n; i++) {
        cout << left
             << setw(15) << mhs[i].nim
             << setw(10) << mhs[i].kelas
             << setw(10) << mhs[i].ipk << endl;
    }
    cout << "==============================" << endl << endl;
}

void sorting() {
    if (n == 0) {
        cout << "Data kosong, isi dulu broo!" << endl << endl;
        return;
    }
    
    // Bubble Sort berdasarkan NIM (Ascending)
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (mhs[j].nim > mhs[j + 1].nim) {
                Mahasiswa temp = mhs[j];
                mhs[j] = mhs[j + 1];
                mhs[j + 1] = temp;
            }
        }
    }
    cout << "Data berhasil diurutkan berdasarkan NIM!" << endl << endl;
}

void searching() {
    if (n == 0) {
        cout << "Isi datanya dulu biar bisa dicari." << endl << endl;
        return;
    }

    int pilih;
    do {
        cout << "MENU SEARCHING  : " << endl;
        cout << "==============================" << endl;
        cout << "1. SEQUENSIAL SEARCH" << endl
             << "2. BINARY SEARCH (Pastikan sudah SORTING)" << endl
             << "3. Kembali ke Menu Utama" << endl;
        cout << "==============================" << endl;
        cout << "Pilih : ";
        cin >> pilih;
        int cari;

        switch (pilih) {
            case 1: {
                cout << "Masukkan NIM yang dicari: ";
                cin >> cari;
                bool ditemukan = false;
                for (int i = 0; i < n; i++) {
                    if (mhs[i].nim == cari) {
                        cout << "\nData ditemukan!" << endl;
                        cout << "NIM   : " << mhs[i].nim << endl;
                        cout << "Kelas : " << mhs[i].kelas << endl;
                        cout << "IPK   : " << mhs[i].ipk << endl << endl;
                        ditemukan = true;
                        break;
                    }
                }
                if (!ditemukan) cout << "Data tidak ditemukan!" << endl << endl;
                break;
            }
            case 2: {
                cout << "Masukkan NIM yang dicari: ";
                cin >> cari;
                int kiri = 0, kanan = n - 1;
                bool ditemukan = false;
                while (kiri <= kanan) {
                    int tengah = (kiri + kanan) / 2;
                    if (mhs[tengah].nim == cari) {
                        cout << "\nData ditemukan!" << endl;
                        cout << "NIM   : " << mhs[tengah].nim << endl;
                        cout << "Kelas : " << mhs[tengah].kelas << endl;
                        cout << "IPK   : " << mhs[tengah].ipk << endl << endl;
                        ditemukan = true;
                        break;
                    } else if (cari < mhs[tengah].nim) {
                        kanan = tengah - 1;
                    } else {
                        kiri = tengah + 1;
                    }
                }
                if (!ditemukan) cout << "Data tidak ditemukan! (Cek apakah sudah disortir)" << endl << endl;
                break;
            }
            case 3:
                break;
            default:
                cout << "Pilihan nggak ada, coba lagi." << endl;
        }
    } while (pilih != 3);
}

int main() {
    int menu;
    do {
        cout << "MENU UTAMA : " << endl;
        cout << "==============================" << endl;
        cout << "1. INPUT DATA" << endl
             << "2. TAMPIL DATA" << endl
             << "3. SEARCHING" << endl
             << "4. SORTING (Urutkan NIM)" << endl
             << "5. EXIT" << endl;
        cout << "==============================" << endl;
        cout << "Pilih  : ";
        cin >> menu;
        cout << endl;

        switch (menu) {
            case 1: inputData(); break;
            case 2: tampilData(); break;
            case 3: searching(); break;
            case 4: sorting(); break;
            case 5: cout << "Bye!" << endl; break;
            default: cout << "Menu Tidak valid!" << endl;
        }
    } while (menu != 5);

    return 0;
}