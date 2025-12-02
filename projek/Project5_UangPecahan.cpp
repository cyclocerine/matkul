#include <iostream>
using namespace std;

void banyakPecahan(long uang, long pecahan[]) {
    int lembar;

    for (int i = 0; i < 9; i++) {
        lembar = uang / pecahan[i];     // Hitung berapa lembar pecahan[i]
        if (lembar > 0) {
            cout << pecahan[i] << " : " << lembar << " lembar" << endl;
        }
        uang = uang % pecahan[i];       // Sisa uang setelah diambil pecahan itu
    }
}

int main() {
    long uang;
    long pecahan[9] = {50000,20000,10000,5000,2000,1000,500,200,100};

    cout << "Jumlah Uang Kembali : Rp ";
    cin >> uang;

    cout << "\nPecahan uang kembali:" << endl;
    banyakPecahan(uang, pecahan);

    return 0;
}
