#include <iostream>
#include "bigint.h"
using namespace std;


int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    cout.precision(10);
    cout << fixed;// << boolalpha;
 
    BigInt n;
    // Menggunakan long long untuk menampung hasil yang besar (hingga 20!)
    BigInt faktorial = 1; 

    cout << "Masukkan bilangan bulat non-negatif: ";
    
    // Memastikan input adalah bilangan
    if (!(cin >> n)) {
        cerr << "Input tidak valid. Harap masukkan bilangan bulat." << endl;
        return 1;
    }

    // --- Logika Perhitungan Faktorial ---

    // 1. Penanganan Kasus Khusus dan Negatif
    if (n < 0) {
        cerr << "Faktorial tidak didefinisikan untuk bilangan negatif." << endl;
        return 1;
    }
    
    // 2. Perhitungan Iteratif (Loop for)
    // Faktorial 0 dan 1 sudah diinisialisasi sebagai 1.
    if (n > 1) {
        for (BigInt i = 2; i <= n; ++i) {
            faktorial *= i;
        }
    }

    // --- Menampilkan Hasil ---
    cout << "Faktorial dari " << n << " adalah " << faktorial << endl;

    return 0;
}
