#include <iostream>
using namespace std;

void konversiWaktu(int totalDetik) {
    int jam = totalDetik  / 3600;
    int sisaDetik = totalDetik % 3600;
    int menit = sisaDetik / 60;
    int detik = sisaDetik  % 60;

    cout << "Hasil Konversi: " << jam << " jam, " << menit << " menit, " << detik << " detik" << endl;
}

int main() {
    int totalDetik;
    cout << "Masukkan total detik: ";
    cin >> totalDetik;

    konversiWaktu(totalDetik);

    return 0;
}