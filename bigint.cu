#include <iostream>
#include "bigint.h"
using namespace std;


int main() {
    // ios::sync_with_stdio(false);
    // cin.tie(nullptr); cout.tie(nullptr);
    // cout.precision(10);
    // cout << fixed;
 
    BigInt n;
    // Menggunakan BigInt untuk menampung hasil yang besar (hingga >200!)
    BigInt faktorial = 1;

    cout << "Masukan Bilangan : ";cin >> n; 

    for (BigInt i = 2; i <= n; ++i) {
                faktorial *= i;
        }
    
    // --- Menampilkan Hasil ---
    cout << "Faktorial dari " << n << " adalah :" << faktorial << endl;

    return 0;
}
