#include <iostream>
using namespace std;


int main() {
    const int size = 5;
    int NilaPraktik[size] = {42, 45, 20, 43, 33};
    int NilaiTeori[size] = {50, 55, 40, 50, 60};

    for (int i = 0; i < size; ++i) {
        cout << "Tugas \t" << "Nilai Praktik \t" << "Nilai Teori \t" <<  "Total Nilai" << endl;
        cout << "Tugas " << i + 1 << "\t" << NilaPraktik[i] << "\t\t" << NilaiTeori[i] << "\t\t" << (NilaPraktik[i] + NilaiTeori[i])/2 << endl;
    }
    cout << endl;

    return 0;
}