#include <iostream>
using namespace std;

bool kabisat(int tahun) {
    if ((tahun % 4 == 0 && tahun % 100 != 0) || (tahun % 400 == 0)) {
        return true;
    }
    return false;
}

int jumlahdigit(int angka) {
    int count = 0;
    while (angka != 0) {
        angka /= 10;
        count++;
    }
    return count;
}

float rupiahusd(float rupiah) {
    return rupiah / 15000.0;
}

float usdrupiah(float usd) {
    return usd * 15000.0;
}

bool kelipatan(int a, int b) {
    return (a % b == 0);
}

float hitungbmi(float berat, float tinggi) {
    return berat / (tinggi * tinggi);
}

int main() {
    int nim_last_digit;
    cout << "Masukkan digit terakhir NIM Anda: ";
    cin >> nim_last_digit;
    if(nim_last_digit % 2 == 1) {
        int pilihan;
        do {
            cout << "\nMenu:\n1. Tahun Kabisat\n2. Konversi Mata Uang\n3. Hitung BMI\n0. Keluar\nPilih menu: ";
            cin >> pilihan;
            if (pilihan == 1) {
                int tahun;
                cout << "Masukkan tahun: ";
                cin >> tahun;
                if (kabisat(tahun)) {
                    cout << tahun << " adalah tahun kabisat.\n";
                } else {
                    cout << tahun << " bukan tahun kabisat.\n";
                }
            } else if (pilihan == 2) {
                int konversiPilihan;
                cout << "Pilih konversi:\n1. Rupiah ke USD\n2. USD ke Rupiah\nPilihan: ";
                cin >> konversiPilihan;
                if (konversiPilihan == 1) {
                    float rupiah;
                    cout << "Masukkan jumlah Rupiah: ";
                    cin >> rupiah;
                    cout << "Hasil konversi ke USD: " << rupiahusd(rupiah) << "\n";
                } else if (konversiPilihan == 2) {
                    float usd;
                    cout << "Masukkan jumlah USD: ";
                    cin >> usd;
                    cout << "Hasil konversi ke Rupiah: " << usdrupiah(usd) << "\n";
                }
            }
            else if (pilihan == 3) {
                    float berat, tinggi;
                    cout << "Masukkan berat (kg): ";
                    cin >> berat;
                    cout << "Masukkan tinggi (m): ";
                    cin >> tinggi;
                    float bmi = hitungbmi(berat, tinggi);
                    cout << "BMI Anda: " << bmi << " (";
                    if (bmi < 18.5) {
                        cout << "Kurus";
                    } else if (bmi < 24.9) {
                        cout << "Normal";
                    } else if (bmi < 29.9) {
                        cout << "Gemuk";
                    } else {
                        cout << "Obesitas";}
                }
        } while (pilihan != 0);
    }
    else {
        int pilihan;
        do {
            cout << "\nMenu:\n1. Hitung Jumlah Digit\n2. Kelipatan dari Bilangan\n3. Hitung BMI\n0. Keluar\nPilih menu: ";
            cin >> pilihan;
            if (pilihan == 1) {
                int angka;
                cout << "Masukkan bilangan: ";
                cin >> angka;
                cout << "Jumlah digit: " << jumlahdigit(angka) << "\n";
            } else if (pilihan == 2) {
                int a, b;
                cout << "Masukkan dua bilangan (a b): ";
                cin >> a >> b;
                if (kelipatan(a, b)) {
                    cout << a << " adalah kelipatan dari " << b << ".\n";
                } else {
                    cout << a << " bukan kelipatan dari " << b << ".\n";
                }
            }
            else if (pilihan == 3) {
                    float berat, tinggi;
                    cout << "Masukkan berat (kg): ";
                    cin >> berat;
                    cout << "Masukkan tinggi (m): ";
                    cin >> tinggi;
                    float bmi = hitungbmi(berat, tinggi);
                    cout << "BMI Anda: " << bmi << " (";
                    if (bmi < 18.5) {
                        cout << "Kurus";
                    } else if (bmi < 24.9) {
                        cout << "Normal";
                    } else if (bmi < 29.9) {
                        cout << "Gemuk";
                    } else {
                        cout << "Obesitas";}
                }
        } while (pilihan != 0);
    }
}