#include <iostream>
using namespace std;

int main() {
    string kalimat;
    cout << "Masukkan kalimat: ";
    getline(cin, kalimat);
    int panjang = kalimat.length();
    int posisi_spasi = -1;
    for (int i = 0; i < panjang; i++) {
        if (kalimat[i] == ' ') {
            posisi_spasi = i;
            break;
        }
    }
    if (posisi_spasi != -1) {
        string pertama = kalimat.substr(0, posisi_spasi);
        string kedua = kalimat.substr(posisi_spasi + 1);
        string kalimat_balik = kedua + " " + pertama;
        cout << "Kalimat setelah dibalik: " << kalimat_balik << endl;
    } else {
        cout << "Kalimat tidak mengandung spasi." << endl;}
}