#include <iostream>
#include <string>
#include <cstdlib>
using namespace std;

int main() {
    int pilih,min,max,total_ken,ken_masuk,kap_max,jml_ken_parkiran;
    min = 0;
    max = 3;
    string user,pw;
    user = "isal";
    pw = "021";
    char kembali_ke_menu;

    do{
    cout<<"=== SISTEM PARKIRAN ==="<<endl;
    cout<<"Masukan username anda : "; cin>>user;
    cout<<"Masukan password anda : "; cin>>pw;

    if(user == "isal" && pw == "021"){
        cout<<"Login Berhasil";
        break;
        }else if(min < 2){
            cout << "Login Gagal, Silahkan Coba Lagi" <<endl;
            min++;
            cout << "Kesempatan Anda : " << 3-min <<endl;
        }else{
            cout << "Login Gagal, Kesempatan Anda Habis" <<endl;
            return 0;
        }
    }while(min < max);

    system("cls");

    do {
        system("cls");
        cout << "\n==== SISTEM PARKIRAN ====" << endl;
        cout << "1. Hitung Biaya Parkir" << endl;
        cout << "2. Cek Kapasitas Parkir" << endl;
        cout << "3. Daftar Nomor Parkir Ganjil-Genap" << endl;
        cout << "4. Keluar" << endl;
        cout << "Pilih menu: "; cin >> pilih;

        switch (pilih) {
            case 1: {
                int lama,jam;
                long total_bayar = 0;
                
                cout << "\nMasukkan lama parkir (jam): ";
                cin >> lama;

                if (lama > 0) {
                    total_bayar = 5000; 
                    jam = 1;
                    while (jam < lama) {
                        total_bayar += 2000;
                        jam++;
                    }
                }
                
                cout << "Total biaya parkir: Rp " << total_bayar << endl;
                break;
            }

            case 2: {
                int ken_masuk,kap_max,total_ken;
                total_ken = 0;
                kap_max = 50;

                do {
                    cout << "\nMasukkan jumlah kendaraan yang masuk (0 untuk selesai): ";
                    cin >> ken_masuk;

                    if (ken_masuk > 0) {
                        if (total_ken + ken_masuk > kap_max) {
                            cout << "Parkiran penuh coy! gabisa nambah kendaraan lagi." << endl;
                            total_ken = kap_max;
                            break; 
                        }
                        total_ken += ken_masuk;
                        cout << "Total kendaraan saat ini: " << total_ken << endl;
                    }
                } while (ken_masuk != 0);
                
                cout << "Total akhir kendaraan di parkiran: " << total_ken << endl;
                break;
            }

            case 3: {
                int jml_ken_parkiran;

                cout << "\nMasukkan jumlah kendaraan di parkiran: ";
                cin >> jml_ken_parkiran;

                cout << "Nomor parkir ganjil: ";
                for (int i = 1; i <= jml_ken_parkiran; i++) {
                    if (i % 2 != 0) {
                        cout << i << " ";
                    }
                }
                cout << endl;

                cout << "Nomor parkir genap: ";
                for (int i = 1; i <= jml_ken_parkiran; i++) {
                    if (i % 2 == 0) {
                        cout << i << " ";
                    }
                }
                cout << endl;
                break;
            }

            case 4:
                cout << "Terima kasih telah menggunakan program ini abangkuh." << endl;
                return 0;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi coy." << endl;
                break;
        }

        cout << "\nKembali ke menu utama? (y/n): ";
        cin >> kembali_ke_menu;

    } while (kembali_ke_menu == 'y' || kembali_ke_menu == 'Y');
    
    system("cls");
    cout << "Program selesai." << endl;

    return 0;
}
