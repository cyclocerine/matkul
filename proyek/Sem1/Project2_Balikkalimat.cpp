#include <iostream>
using namespace std;

void ubah(char teks[]) {
    char kata[50][50];
    int jmlKata = 0;
    int i = 0, k = 0;

    while (teks[i] != '\0') {
        if (teks[i] != ' ') {
            kata[jmlKata][k] = teks[i];
            k++;
        } else {
            kata[jmlKata][k] = '\0'; // akhir 1 kata
            jmlKata++;
            k = 0;
        }
        i++;
    }
    kata[jmlKata][k] = '\0'; 
    jmlKata++;

    cout << "Kalimat baru : ";
    for (int x = jmlKata - 1; x >= 0; x--) {
        cout << kata[x];
        if (x > 0) cout << " ";
    }
    cout << endl;
}

int main() {
    char kalimat[200];

    cout << "Masukkan kalimat : ";
    cin.getline(kalimat, 200);

    ubah(kalimat);

    return 0;
}