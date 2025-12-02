#include <iostream>
using namespace std;

int main() {
    const int jumlah_mahasiswa = 10;
    int nilai[jumlah_mahasiswa];
    int i = 0;

    // Input nilai mahasiswa
    while (i < jumlah_mahasiswa) {
        cout << "Masukkan nilai mahasiswa ke-" << (i + 1) << ": ";
        cin >> nilai[i];
        i++;
    }

    // Mencari nilai tertinggi
    int nilai_tertinggi = nilai[0];
    i = 1;
    while (i < jumlah_mahasiswa) {
        if (nilai[i] > nilai_tertinggi) {
            nilai_tertinggi = nilai[i];
        }
        i++;
    }

    // Menghitung berapa orang yang mendapat nilai tertinggi
    int jumlah_tertinggi = 0;
    i = 0;
    while (i < jumlah_mahasiswa) {
        if (nilai[i] == nilai_tertinggi) {
            jumlah_tertinggi++;
        }
        i++;
    }

    // Menampilkan hasil
    cout << "Nilai tertinggi = " << nilai_tertinggi << endl;
    cout << "Banyaknya mahasiswa memiliki nilai tertinggi = " << jumlah_tertinggi << endl;

    return 0;
}