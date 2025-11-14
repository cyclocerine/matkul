#include <iostream>
#include <string>
using namespace std;
const int maks_tim = 13;

void inputTim(string tim[], int size) {
    for (int i = 0; i < size; i++) {
        cout << "Masukkan nama tim ke-" << (i + 1) << ": ";
        getline(cin, tim[i]);
    }
}

void tampilTim(const string tim[], int size) {
    int i = 0;
    while (i < size) {
        cout << "Tim ke-" << (i + 1) << ": " << tim[i] << endl;
        i++;
    }
}

int main() {
    string tim[maks_tim];
    int pilihan;

    do {
        cout << "\nMenu Piala Dunia FIFA 1930\n";
        cout << "1. Input Data Tim\n";
        cout << "2. Tampilkan Data Tim\n";
        cout << "3. Keluar\n";
        cout << "Pilih menu (1-3): ";
        cin >> pilihan;
        cin.ignore();

        switch (pilihan) {
            case 1:
                inputTim(tim, maks_tim);
                break;
            case 2:
                tampilTim(tim, maks_tim);
                break;
            case 3:
                cout << "Keluar dari program.\n";
                break;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi.\n";
        }
    } while (pilihan != 3);

    return 0;
}