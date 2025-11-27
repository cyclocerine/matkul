#include <iostream>
#include <string>
#include <iomanip>
#include <cstdlib>
using namespace std;

int main(){
    int pilihan, harga;
    string film, jadwal;
    cout << "Selamat datang di Pemesanan Tiket Bioskop!" << endl;
    cout << "Pilih film yang ingin ditonton:" << endl;
    cout << "1. Sampai Titik Terakhirmu" << endl;
    cout << "2. Agak Laen: Menyala Pantiku" << endl;
    cout << "3. Zootopia 2" << endl;
    cout << "4. Insidious: The Red Door" << endl;
    cout << "5. Avatar 2" << endl;
    cout << "Masukkan pilihan (1-5): ";
    cin >> pilihan;

    switch (pilihan)
    {
    case 1:{
        //pilih kursi dan jadwal untuk film 1
        film = "Sampai Titik Terakhirmu";
        cout << "Anda memilih film: " << film << endl;
        cout << "Tayang Pada 1.00 PM" << endl;
        cout << "Pilih kursi (x berarti tidak tersedia, bisa pilih lebih dari 1 kursi):" << endl;
        cout << "A1 A2 A3 A4 A5" << endl;
        cout << "B1 B2 B3 B4 B5" << endl;
        cout << "C1 C2 C3 C4 C5" << endl;
        cout << "D1 D2 D3 D4 D5" << endl;
        cout << "Masukkan kursi yang dipilih: ";
        string kursi1;
        cin >> kursi1;
        harga = 50000;
        cout << "Kursi " << kursi1 << " berhasil dipesan untuk film " << film << " pada jam 1.00 PM." << endl;
        cout << "Total harga: Rp " << harga << endl;
        system("clear || cls");
        cout << "Invoice Pemesanan Tiket Bioskop" << endl;
        cout << "==============================" << endl;
        cout << "Film: " << film << endl;
        cout << "Kursi: " << kursi1 << endl;
        cout << "Jadwal: 1.00 PM" << endl;
        cout << "Total Harga: Rp " << harga << endl;
        cout << "==============================" << endl;
        cout << "Terima kasih telah memesan tiket di bioskop kami!" << endl;
        break;}
    case 2:{
        //pilih kursi dan jadwal untuk film 2
        film = "Agak Laen: Menyala Pantiku";
        cout << "Anda memilih film: " << film << endl;
        cout << "Tayang Pada 3.00 PM" << endl;
        cout << "Pilih kursi (x berarti tidak tersedia, bisa pilih lebih dari 1 kursi):" << endl;
        cout << "A1 A2 A3 A4 A5" << endl;
        cout << "B1 B2 B3 B4 B5" << endl;
        cout << "C1 C2 C3 C4 C5" << endl;
        cout << "D1 D2 D3 D4 D5" << endl;
        cout << "Masukkan kursi yang dipilih: ";
        string kursi2;
        cin >> kursi2;
        harga = 60000;
        cout << "Kursi " << kursi2 << " berhasil dipesan untuk film " << film << " pada jam 3.00 PM." << endl;
        cout << "Total harga: Rp " << harga << endl;
        system("clear || cls");
        cout << "Invoice Pemesanan Tiket Bioskop" << endl;
        cout << "==============================" << endl;
        cout << "Film: " << film << endl;
        cout << "Kursi: " << kursi2 << endl;
        cout << "Jadwal: 3.00 PM" << endl;
        cout << "Total Harga: Rp " << harga << endl;
        cout << "==============================" << endl;
        cout << "Terima kasih telah memesan tiket di bioskop kami!" << endl;
        break;}
    case 3:{
        //pilih kursi dan jadwal untuk film 3
        film = "Zootopia 2";
        cout << "Anda memilih film: " << film << endl;
        cout << "Tayang Pada 5.00 PM" << endl;
        cout << "Pilih kursi (x berarti tidak tersedia, bisa pilih lebih dari 1 kursi):" << endl;
        cout << "A1 A2 A3 A4 A5" << endl;
        cout << "B1 B2 B3 B4 B5" << endl;
        cout << "C1 C2 C3 C4 C5" << endl;
        cout << "D1 D2 D3 D4 D5" << endl;
        cout << "Masukkan kursi yang dipilih: ";
        string kursi3;
        cin >> kursi3;
        harga = 55000;
        cout << "Kursi " << kursi3 << " berhasil dipesan untuk film " << film << " pada jam 5.00 PM." << endl;
        cout << "Total harga: Rp " << harga << endl;
        system("clear || cls");
        cout << "Invoice Pemesanan Tiket Bioskop" << endl;
        cout << "==============================" << endl;
        cout << "Film: " << film << endl;
        cout << "Kursi: " << kursi3 << endl;
        cout << "Jadwal: 5.00 PM" << endl;
        cout << "Total Harga: Rp " << harga << endl;
        cout << "==============================" << endl;
        cout << "Terima kasih telah memesan tiket di bioskop kami!" << endl;
        break;}
    case 4:{
        //pilih kursi dan jadwal untuk film 4
        film = "Insidious: The Red Door";
        cout << "Anda memilih film: " << film << endl;
        cout << "Tayang Pada 7.00 PM" << endl;
        cout << "Pilih kursi (x berarti tidak tersedia, bisa pilih lebih dari 1 kursi):" << endl;
        cout << "A1 A2 A3 A4 A5" << endl;
        cout << "B1 B2 B3 B4 B5" << endl;
        cout << "C1 C2 C3 C4 C5" << endl;
        cout << "D1 D2 D3 D4 D5" << endl;
        cout << "Masukkan kursi yang dipilih: ";
        string kursi4;
        cin >> kursi4;
        harga = 70000;
        cout << "Kursi " << kursi4 << " berhasil dipesan untuk  film " << film << " pada jam 7.00 PM." << endl;
        cout << "Total harga: Rp " << harga << endl;
        system("clear || cls");
        cout << "Invoice Pemesanan Tiket Bioskop" << endl;
        cout << "==============================" << endl;
        cout << "Film: " << film << endl;
        cout << "Kursi: " << kursi4 << endl;
        cout << "Jadwal: 7.00 PM" << endl;
        cout << "Total Harga: Rp " << harga << endl;
        cout << "==============================" << endl;
        cout << "Terima kasih telah memesan tiket di bioskop kami!" << endl;
        break;}
    case 5:{
        //pilih kursi dan jadwal untuk film 5
        film = "Avatar 2";
        cout << "Anda memilih film: " << film << endl;
        cout << "Tayang Pada 9.00 PM" << endl;
        cout << "Pilih kursi (x berarti tidak tersedia, bisa pilih lebih dari 1 kursi):" << endl;
        cout << "A1 A2 A3 A4 A5" << endl;
        cout << "B1 B2 B3 B4 B5" << endl;
        cout << "C1 C2 C3 C4 C5" << endl;
        cout << "D1 D2 D3 D4 D5" << endl;
        cout << "Masukkan kursi yang dipilih: ";
        string kursi5;
        cin >> kursi5;
        harga = 70000;
        cout << "Kursi " << kursi5 << " berhasil dipesan untuk  film " << film << " pada jam 7.00 PM." << endl;
        cout << "Total harga: Rp " << harga << endl;
        system("clear || cls");
        cout << "Invoice Pemesanan Tiket Bioskop" << endl;
        cout << "==============================" << endl;
        cout << "Film: " << film << endl;
        cout << "Kursi: " << kursi5 << endl;
        cout << "Jadwal: 7.00 PM" << endl;
        cout << "Total Harga: Rp " << harga << endl;
        cout << "==============================" << endl;
        cout << "Terima kasih telah memesan tiket di bioskop kami!" << endl;
        break;}
    default: cout << "Pilihan tidak valid!" << endl;
        break;
    }
}