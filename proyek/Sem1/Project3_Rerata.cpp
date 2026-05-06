#include <iostream>
using namespace std;

int hitungJumlah(int data[], int ukuran) {
    int jumlah = 0;
    for (int i = 0; i < ukuran; i++) {
        if (data[i] < 5 || data[i] >= 7) {
            jumlah += data[i];
        }
    }
    return jumlah;
}

double hitungRataRata(int data[], int ukuran) {
    int jumlah = 0;
    int count = 0;
    for (int i = 0; i < ukuran; i++) {
        if (data[i] < 5 || data[i] >= 7) {
            jumlah += data[i];
            count++;
        }
    }
    return (count == 0) ? 0 : static_cast<double>(jumlah) / count;
}

int main() {
    int data[] = {2, 5, 1, 2, 4, 6, 3, 2, 7, 1};
    int ukuran = sizeof(data) / sizeof(data[0]);

    int jumlah = hitungJumlah(data, ukuran);
    double rataRata = hitungRataRata(data, ukuran);

    cout << "Jumlah nilai yang lebih kecil dari 5 atau lebih besar sama dengan 7: " << jumlah << endl;
    cout << "Rata-rata nilai yang lebih kecil dari 5 atau lebih besar sama dengan 7: " << rataRata << endl;

    return 0;
}