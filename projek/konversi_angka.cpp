#include <iostream>
#include <string>
using namespace std;

string konversiAngkaKeTerbilang(int angka) {
    string satuan[] = {"", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan"};
    string belasan[] = {"sepuluh", "sebelas", "dua belas", "tiga belas", "empat belas", "lima belas", 
                       "enam belas", "tujuh belas", "delapan belas", "sembilan belas"};
    string puluhan[] = {"", "", "dua puluh", "tiga puluh", "empat puluh", "lima puluh", 
                       "enam puluh", "tujuh puluh", "delapan puluh", "sembilan puluh"};

    if (angka < 1 || angka > 99) {
        return "Angka di luar jangkauan (1-99)";
    } else if (angka < 10) {
        return satuan[angka];
    } else if (angka < 20) {
        return belasan[angka - 10];
    } else {
        int puluh = angka / 10;
        int satu = angka % 10;
        return puluhan[puluh] + (satu != 0 ? " " + satuan[satu] : "");
    }
}

int main() {
    int angka;
    cout << "Masukkan angka (1-99): ";
    cin >> angka;

    string terbilang = konversiAngkaKeTerbilang(angka);
    cout << "Terbilang: " << terbilang << endl;

    return 0;
}