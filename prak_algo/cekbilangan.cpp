//program pengecek bilangan, apakah bilangan termasuk kelipatan 2, 3, 5 atau ketiganya, serta pengecek bilnagan ganjil dan genap
#include <iostream>
using namespace std;

int main() {
    int bilangan;

    cout << "Masukkan sebuah bilangan: ";
    cin >> bilangan;

    // Cek kelipatan 2, 3, dan 5
    if (bilangan % 2 == 0) {
        cout << bilangan << " adalah kelipatan 2." << endl;
    } else {
        cout << bilangan << " bukan kelipatan 2." << endl;
    }

    if (bilangan % 3 == 0) {
        cout << bilangan << " adalah kelipatan 3." << endl;
    } else {
        cout << bilangan << " bukan kelipatan 3." << endl;
    }

    if (bilangan % 5 == 0) {
        cout << bilangan << " adalah kelipatan 5." << endl;
    } else {
        cout << bilangan << " bukan kelipatan 5." << endl;
    }

    // Cek ganjil atau genap
    if (bilangan % 2 == 0) {
        cout << bilangan << " adalah bilangan genap." << endl;
    } else {
        cout << bilangan << " adalah bilangan ganjil." << endl;
    }

    return 0;
}