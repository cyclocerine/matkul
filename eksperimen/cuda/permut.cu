#include <iostream>
using namespace std;


long long factorial(int num) {
    long long result = 1;
    for (int i = 1; i <= num; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int n, t, k, i;
    long long hasil = 1, pembagi = 1;

    cout << "total huruf (total unsur): ";
    cin >> n;
    cout << "input total k (t): ";
    cin >> t;

    hasil = factorial(n);
    

    cout << "Masukkan nilai k :\n";
    for (i = 1; i <= t; i++) {
        cout << "k" << i << ": ";
        cin >> k;
        pembagi *= factorial(k);
            cout << "pembagi " << pembagi << endl;
        }

    long long permutasi = hasil / pembagi;
    cout << "hasil " << permutasi << endl;

    return 0;
}//MISSISIPI
