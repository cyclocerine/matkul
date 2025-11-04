#include <iostream>
using namespace std;

int main() {
    int n, t, k, i;
    long long hasil = 1, pembagi = 1;

    cout << "total huruf (total unsur): ";
    cin >> n;
    cout << "input total k (t): ";
    cin >> t;

    for (i = 1; i <= n; i++) {
        hasil *= i;
    }

    cout << "Masukkan nilai k :\n";
    for (i = 1; i <= t; i++) {
        cout << "k" << i << ": ";
        cin >> k;
        for (int j = 1; j <= k; j++) {
            pembagi *= j;
        }
    }

    long long permutasi = hasil / pembagi;
    cout << "hasil " << permutasi << endl;

    return 0;
}
