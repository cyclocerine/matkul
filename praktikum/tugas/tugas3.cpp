#include <iostream>
#include <string>
#include <limits>

using namespace std;

const float KURS_USD_KE_IDR = 15000.0;

bool kabisat(int tahun);
int jumlahdigit(int angka);
float rupiahusd(float rupiah);
float usdrupiah(float usd);
bool kelipatan(int a, int b);
float hitungbmi(float berat, float tinggi);

void jalankanCekKabisat();
void jalankanKonversiUang();
void jalankanHitungDigit();
void jalankanCekKelipatan();
void jalankanHitungBmi();
void tampilkanMenuGanjil();
void tampilkanMenuGenap();
int dapatkanInputInteger(string prompt);
float dapatkanInputFloat(string prompt);

int main() {
    int nim_last_digit = dapatkanInputInteger("Masukkan digit terakhir NIM Anda: ");
    
    if(nim_last_digit % 2 == 1) {
        tampilkanMenuGanjil();
    } else {
        tampilkanMenuGenap();
    }
    
    cout << "\nTerima kasih! Program selesai." << endl;
    return 0;
}

bool kabisat(int tahun) {
    if ((tahun % 4 == 0 && tahun % 100 != 0) || (tahun % 400 == 0)) {
        return true;
    }
    return false;
}

int jumlahdigit(int angka) {
    if (angka == 0) {
        return 1;
    }
    
    int count = 0;
    if (angka < 0) {
        angka = -angka;
    }
    
    while (angka != 0) {
        angka /= 10;
        count++;
    }
    return count;
}

float rupiahusd(float rupiah) {
    return rupiah / KURS_USD_KE_IDR;
}

float usdrupiah(float usd) {
    return usd * KURS_USD_KE_IDR;
}

bool kelipatan(int a, int b) {
    if (b == 0) {
        return false;
    }
    return (a % b == 0);
}

float hitungbmi(float berat, float tinggi) {
    if (tinggi == 0) {
        return 0.0;
    }
    return berat / (tinggi * tinggi);
}

void jalankanCekKabisat() {
    int tahun = dapatkanInputInteger("Masukkan tahun: ");
    if (kabisat(tahun)) {
        cout << tahun << " adalah tahun kabisat.\n";
    } else {
        cout << tahun << " bukan tahun kabisat.\n";
    }
}

void jalankanKonversiUang() {
    cout << "Pilih konversi:\n1. Rupiah ke USD\n2. USD ke Rupiah\n";
    int konversiPilihan = dapatkanInputInteger("Pilihan: ");
    
    if (konversiPilihan == 1) {
        float rupiah = dapatkanInputFloat("Masukkan jumlah Rupiah: ");
        cout << "Hasil konversi ke USD: " << rupiahusd(rupiah) << "\n";
    } else if (konversiPilihan == 2) {
        float usd = dapatkanInputFloat("Masukkan jumlah USD: ");
        cout << "Hasil konversi ke Rupiah: " << usdrupiah(usd) << "\n";
    } else {
        cout << "Pilihan tidak valid.\n";
    }
}

void jalankanHitungDigit() {
    int angka = dapatkanInputInteger("Masukkan bilangan: ");
    cout << "Jumlah digit: " << jumlahdigit(angka) << "\n";
}

void jalankanCekKelipatan() {
    int a = dapatkanInputInteger("Masukkan bilangan pertama (a): ");
    int b = dapatkanInputInteger("Masukkan bilangan kedua (b): ");
    if (kelipatan(a, b)) {
        cout << a << " adalah kelipatan dari " << b << ".\n";
    } else {
        cout << a << " bukan kelipatan dari " << b << ".\n";
    }
}

void jalankanHitungBmi() {
    float berat = dapatkanInputFloat("Masukkan berat (kg): ");
    float tinggi = dapatkanInputFloat("Masukkan tinggi (m): ");

    if (tinggi <= 0 || berat <= 0) {
        cout << "Tinggi dan berat harus lebih dari 0.\n";
        return;
    }

    float bmi = hitungbmi(berat, tinggi);
    cout << "BMI Anda: " << bmi << " (";
    if (bmi < 18.5) {
        cout << "Kurus";
    } else if (bmi < 24.9) {
        cout << "Normal";
    } else if (bmi < 29.9) {
        cout << "Gemuk";
    } else {
        cout << "Obesitas";
    }
    cout << ")\n";
}

void tampilkanMenuGanjil() {
    int pilihan;
    do {
        cout << "\n=== Menu (NIM Ganjil) ===\n";
        cout << "1. Tahun Kabisat\n";
        cout << "2. Konversi Mata Uang\n";
        cout << "3. Hitung BMI\n";
        cout << "0. Keluar\n";
        pilihan = dapatkanInputInteger("Pilih menu: ");

        switch (pilihan) {
            case 1:
                jalankanCekKabisat();
                break;
            case 2:
                jalankanKonversiUang();
                break;
            case 3:
                jalankanHitungBmi();
                break;
            case 0:
                break;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi.\n";
        }
    } while (pilihan != 0);
}

void tampilkanMenuGenap() {
    int pilihan;
    do {
        cout << "\n=== Menu (NIM Genap) ===\n";
        cout << "1. Hitung Jumlah Digit\n";
        cout << "2. Kelipatan dari Bilangan\n";
        cout << "3. Hitung BMI\n";
        cout << "0. Keluar\n";
        pilihan = dapatkanInputInteger("Pilih menu: ");

        switch (pilihan) {
            case 1:
                jalankanHitungDigit();
                break;
            case 2:
                jalankanCekKelipatan();
                break;
            case 3:
                jalankanHitungBmi();
                break;
            case 0:
                break;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi.\n";
        }
    } while (pilihan != 0);
}

int dapatkanInputInteger(string prompt) {
    int value;
    while (true) {
        cout << prompt;
        if (cin >> value) {
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            return value;
        } else {
            cout << "Input tidak valid. Harap masukkan angka.\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }
    }
}

float dapatkanInputFloat(string prompt) {
    float value;
    while (true) {
        cout << prompt;
        if (cin >> value) {
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            return value;
        } else {
            cout << "Input tidak valid. Harap masukkan angka (misal: 1.75).\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }
    }
}