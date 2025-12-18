#include <iostream>
#include <string>
#include <iomanip>
#include <cstdlib>
using namespace std;

int main(){
    string nomor;
    int nominal, pilihan;
    cout << "Masukkan nomor telepon: ";
    cin >> nomor;
    system("clear || cls");
    cout << "Nomor telepon yang dimasukkan: " << nomor << endl;
    cout << "Pilih nominal pulsa yang diinginkan:" << endl;
    cout << "1. Rp 10.000" << endl;
    cout << "2. Rp 20.000" << endl;
    cout << "3. Rp 50.000" << endl;
    cout << "4. Rp 100.000" << endl;
    cout << "Masukkan pilihan (1-4): ";
    cin >> pilihan;
    switch(pilihan){
        case 1:
            nominal = 10000;
            cout << "Anda memilih nominal Rp " << nominal << endl;
            cout << "Proses pengisian pulsa..." << endl;
            cout << "Pulsa sebesar Rp " << nominal << " berhasil diisi ke nomor " << nomor << endl;
            break;
        case 2:
            nominal = 20000;
            cout << "Anda memilih nominal Rp " << nominal << endl;
            cout << "Proses pengisian pulsa..." << endl;
            cout << "Pulsa sebesar Rp " << nominal << " berhasil diisi ke nomor " << nomor << endl;
            break;
        case 3:
            nominal = 50000;
            cout << "Anda memilih nominal Rp " << nominal << endl;
            cout << "Proses pengisian pulsa..." << endl;
            cout << "Pulsa sebesar Rp " << nominal << " berhasil diisi ke nomor " << nomor << endl;
            break;
        case 4:
            nominal = 100000;
            cout << "Anda memilih nominal Rp " << nominal << endl;
            cout << "Proses pengisian pulsa..." << endl;
            cout << "Pulsa sebesar Rp " << nominal << " berhasil diisi ke nomor " << nomor << endl;
            break;
        default:
            cout << "Pilihan tidak valid!" << endl;
            return 1;

        }
}