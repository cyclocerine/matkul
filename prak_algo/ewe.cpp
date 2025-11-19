//E-Ticketing Wahana Express (E.W.E)
//Deskripsi: Program ini mengimplementasikan sistem e-ticketing untuk wahana di taman hiburan dengan fitur jalur express (EWE).
//Fitur Utama: Pengguna dapat memilih untuk membeli tiket reguler atau tiket dengan jalur express yang memungkinkan mereka untuk melewati antrean panjang.
#include <iostream>
#include <string>
#include <vector>
#include <iomanip> // Untuk format angka

using namespace std;

// Struktur untuk menyimpan data tiket
struct Tiket {
    string idTiket;
    string namaPengunjung;
    string namaWahana;
    double hargaDasar;
    bool isExpress; // Fitur EWE (Express)
};

// Variabel global untuk harga tambahan jalur Express
const double BIAYA_EXPRESS = 50000;

// Fungsi untuk menampilkan garis pembatas biar rapi
void garis() {
    cout << "===========================================" << endl;
}

// Fungsi untuk membuat ID Tiket otomatis (simple random logic)
string generateID() {
    string id = "EWE-" + to_string(rand() % 9000 + 1000);
    return id;
}

int main() {
    vector<Tiket> daftarTiket;
    int pilihanWahana;
    char lanjut;
    char pilihExpress;

    do {
        Tiket tiketBaru;
        system("cls || clear"); // Gunakan "clear" jika di Linux/Mac
        
        garis();
        cout << "    SISTEM E.W.E (E-ticket Wahana Express)" << endl;
        cout << "           Selamat Datang!" << endl;
        garis();

        // 1. Input Nama
        cout << "Masukkan Nama Pengunjung: ";
        cin.ignore();
        getline(cin, tiketBaru.namaPengunjung);

        // 2. Pilih Wahana
        cout << "\nPilih Wahana:\n";
        cout << "1. Roller Coaster (Rp 100.000)\n";
        cout << "2. Rumah Hantu    (Rp 75.000)\n";
        cout << "3. Arung Jeram    (Rp 90.000)\n";
        cout << "Pilihan (1-3): ";
        cin >> pilihanWahana;

        switch (pilihanWahana) {
            case 1:
                tiketBaru.namaWahana = "Roller Coaster";
                tiketBaru.hargaDasar = 100000;
                break;
            case 2:
                tiketBaru.namaWahana = "Rumah Hantu";
                tiketBaru.hargaDasar = 75000;
                break;
            case 3:
                tiketBaru.namaWahana = "Arung Jeram";
                tiketBaru.hargaDasar = 90000;
                break;
            default:
                cout << "Pilihan salah! Default ke Roller Coaster.\n";
                tiketBaru.namaWahana = "Roller Coaster";
                tiketBaru.hargaDasar = 100000;
        }

        // 3. Fitur Utama: Wahana Express
        cout << "\nMau upgrade ke Jalur Express (+Rp " << (int)BIAYA_EXPRESS << ")? (y/n): ";
        cin >> pilihExpress;

        if (pilihExpress == 'y' || pilihExpress == 'Y') {
            tiketBaru.isExpress = true;
        } else {
            tiketBaru.isExpress = false;
        }

        tiketBaru.idTiket = generateID();
        daftarTiket.push_back(tiketBaru);

        // 4. Output Struk (Bukti EWE)
        cout << "\nProcessing..." << endl;
        system("cls || clear"); // Clear screen lagi biar bersih pas cetak tiket
        
        garis();
        cout << "          E-TICKET WAHANA EXPRESS" << endl;
        garis();
        cout << "ID Tiket      : " << tiketBaru.idTiket << endl;
        cout << "Nama          : " << tiketBaru.namaPengunjung << endl;
        cout << "Wahana        : " << tiketBaru.namaWahana << endl;
        cout << "Tipe Tiket    : " << (tiketBaru.isExpress ? "EXPRESS (VIP)" : "Reguler") << endl;
        garis();
        
        double totalBayar = tiketBaru.hargaDasar + (tiketBaru.isExpress ? BIAYA_EXPRESS : 0);
        
        cout << "Harga Wahana  : Rp " << fixed << setprecision(0) << tiketBaru.hargaDasar << endl;
        if (tiketBaru.isExpress) {
            cout << "Biaya Express : Rp " << BIAYA_EXPRESS << endl;
        }
        cout << "TOTAL BAYAR   : Rp " << totalBayar << endl;
        garis();
        cout << "  Terima kasih telah menggunakan sistem EWE!" << endl;
        garis();

        cout << "\nBeli tiket lagi? (y/n): ";
        cin >> lanjut;
        cin.ignore();

    } while (lanjut == 'y' || lanjut == 'Y');

    cout << "\nProgram selesai. Sampai jumpa!" << endl;

    return 0;
}