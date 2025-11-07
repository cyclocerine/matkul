#include <iostream>
using namespace std;

void konversiWaktu(int totalDetik) {
    int jam = totalDetik  / 3600;
    int sisaDetikSetelahJam = totalDetik % 3600;
    int menit = sisaDetikSetelahJam / 60;
    int detik = sisaDetikSetelahJam  % 60;

    cout << "Hasil Konversi: " << jam << " jam, " << menit << " menit, " << detik << " detik" << endl;
}

int main() {
    int totalDetik;
    cout << "Masukkan total detik: ";
    cin >> totalDetik;

    konversiWaktu(totalDetik);

    return 0;
}