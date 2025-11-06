#include <iostream>
using namespace std;
long long permutasi(int n, int r) {
    if (r > n) return 0;
    long long result = 1;
    for (int i = 0; i < r; i++) {
        result *= (n - i);
    }
    return result;
}

int main() {
    int n, r;
    cout << "Masukkan nilai n (total item): ";
    cin >> n;
    cout << "Masukkan nilai r (item yang dipilih): ";
    cin >> r;
    long long hasil = permutasi(n, r);
    cout << "Permutasi P(" << n << ", " << r << ") = " << hasil << endl;
    return 0;
}
