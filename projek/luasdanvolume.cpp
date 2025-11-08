//menghitung luas bangun datar dan volume bangunruang
#include <iostream>
#include <cstdlib>
#include "count.h"
using namespace std;

int main(){
    string nama, nim;
    cout << "===================================\n" << endl;
    cout << "Masukkan Nama: ";
    getline(cin, nama);
    cout << "Masukkan NIM: ";
    getline(cin, nim);
    cout << "===================================\n" << endl;
    system("clear||cls");
    while (true)
    {
        cout << "=================================\n" << endl;
        cout << "Nama: " << nama << endl;
        cout << "NIM: " << nim << endl;
        cout << "=================================\n" << endl;
        cout << "Program untuk menghitung luas bangun datar dan volume bangun ruang\n";
        cout << "1. Luas Bangun Datar\n";
        cout << "2. Volume Bangun Ruang\n";
        cout << "3. Keluar\n";
        cout << "Pilih menu (1-3): ";
        int choice;
        cin >> choice;
        if (choice == 1) {
            system("clear||cls");
            cout << "Menghitung Luas Bangun Datar\n";
            while (true) {
                cout << "Pilih bangun datar:\n";
                cout << "1. Persegi\n";
                cout << "2. Persegi Panjang\n";
                cout << "3. Lingkaran\n";
                cout << "4. Segitiga\n";
                cout << "5. Jajar Genjang\n";
                cout << "6. Belah Ketupat\n";
                cout << "7. Trapesium\n";
                cout << "8. Layang-Layang\n";
                cout << "9. Kembali ke menu utama\n";
                cout << "Pilihan Anda (1-9): ";
                int shapeChoice;
                cin >> shapeChoice;
                if (shapeChoice == 9) {
                    system("clear||cls");
                    break; // Kembali ke menu utama
                }
                switch (shapeChoice) {
                    case 1: {
                        float sisi;
                        cout << "Masukkan sisi persegi: ";
                        cin >> sisi;
                        cout << "Luas Persegi: " << luasPersegi(sisi) << endl;
                        break;
                    }
                    case 2: {
                        float panjang, lebar;
                        cout << "Masukkan panjang dan lebar persegi panjang: ";
                        cin >> panjang >> lebar;
                        cout << "Luas Persegi Panjang: " << luasPersegiPanjang(panjang, lebar) << endl;
                        break;
                    }
                    case 3: {
                        float radius;
                        cout << "Masukkan radius lingkaran: ";
                        cin >> radius;
                        cout << "Luas Lingkaran: " << luasLingkaran(radius) << endl;
                        break;
                    }
                    case 4: {
                        float alas, tinggi;
                        cout << "Masukkan alas dan tinggi segitiga: ";
                        cin >> alas >> tinggi;
                        cout << "Luas Segitiga: " << luasSegitiga(alas, tinggi) << endl;
                        break;
                    }
                    case 5: {
                        float alas, tinggi;
                        cout << "Masukkan alas dan tinggi jajar genjang: ";
                        cin >> alas >> tinggi;
                        cout << "Luas Jajar Genjang: " << jajargenjang(alas, tinggi) << endl;
                        break;
                    }
                    case 6: {
                        float d1, d2;
                        cout << "Masukkan diagonal 1 dan diagonal 2 belah ketupat: ";
                        cin >> d1 >> d2;
                        cout << "Luas Belah Ketupat: " << belahKetupat(d1, d2) << endl;
                        break;
                    }
                    case 7: {
                        float a, b, tinggi;
                        cout << "Masukkan sisi a, sisi b, dan tinggi trapesium: ";
                        cin >> a >> b >> tinggi;
                        cout << "Luas Trapesium: " << trapesium(a, b, tinggi) << endl;
                        break;
                    }
                    case 8: {
                        float d1, d2;
                        cout << "Masukkan diagonal 1 dan diagonal 2 layang-layang: ";
                        cin >> d1 >> d2;
                        cout << "Luas Layang-Layang: " << layangLayang(d1, d2) << endl;
                        break;
                    default:
                        cout << "Pilihan tidak valid. Silakan coba lagi.\n";
                        break;
                }
            }
        }
        } else if (choice == 2) {
            system("clear||cls");
            cout << "Menghitung Volume Bangun Ruang\n";
            while (true)
            {
                cout << "Pilih bangun ruang:\n";
                cout << "1. Kubus\n";
                cout << "2. Balok\n";
                cout << "3. Bola\n";
                cout << "4. Silinder\n";
                cout << "5. Kerucut\n";
                cout << "6. Limas\n";
                cout << "7. Prisma\n";
                cout << "8. Kembali ke menu utama\n";
                cout << "Pilihan Anda (1-8): ";
                int shapeChoice;
                cin >> shapeChoice;
                if (shapeChoice == 7) {
                    system("clear||cls");
                    break; // Kembali ke menu utama
                }
                switch (shapeChoice) {
                    case 1: {
                        float sisi;
                        cout << "Masukkan sisi kubus: ";
                        cin >> sisi;
                        cout << "Volume Kubus: " << volumeKubus(sisi) << endl;
                        break;
                    }
                    case 2: {
                        float panjang, lebar, tinggi;
                        cout << "Masukkan panjang, lebar, dan tinggi balok: ";
                        cin >> panjang >> lebar >> tinggi;
                        cout << "Volume Balok: " << volumeBalok(panjang, lebar, tinggi) << endl;
                        break;
                    }
                    case 3: {
                        float radius;
                        cout << "Masukkan radius bola: ";
                        cin >> radius;
                        cout << "Volume Bola: " << volumeBola(radius) << endl;
                        break;
                    }
                    case 4: {
                        float radius, tinggi;
                        cout << "Masukkan radius dan tinggi silinder: ";
                        cin >> radius >> tinggi;
                        cout << "Volume Silinder: " << volumeTabung(radius, tinggi) << endl;
                        break;
                    }
                    case 5: {
                        float radius, tinggi;
                        cout << "Masukkan radius dan tinggi kerucut: ";
                        cin >> radius >> tinggi;
                        cout << "Volume Kerucut: " << volumeKerucut(radius, tinggi) << endl;
                        break;}
                    case 6: {
                        float luasAlas, tinggi;
                        cout << "Masukkan luas alas dan tinggi limas: ";
                        cin >> luasAlas >> tinggi;
                        cout << "Volume Limas: " << volumeLimas(luasAlas, tinggi) << endl;
                        break;}
                    case 7: {
                        float luasAlas, tinggi;
                        cout << "Masukkan luas alas dan tinggi prisma: ";
                        cin >> luasAlas >> tinggi;
                        cout << "Volume Prisma: " << volumeLimas(luasAlas, tinggi) << endl;
                        break;}
                    default:
                        cout << "Pilihan tidak valid. Silakan coba lagi.\n";
                        break;
                }
            }
            
        } else if (choice == 3) {
            cout << "Terima kasih telah menggunakan program ini!\n";
            break;
        } else {
            cout << "Pilihan tidak valid. Silakan coba lagi.\n";
        }
    }
    
}