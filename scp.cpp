#include <iostream>
#include <string>
#include <cstdlib>
using namespace std;

void menu() {
    int pilihan;
    char ulangi_menu;

    do {
        cout << "\n===============================" << endl;
        cout << "Pilih Menu:" << endl;
        cout << "1. Angka 1" << endl;
        cout << "2. Bintang Garis" << endl;
        cout << "===============================" << endl;
        cout << "Masukkan pilihan (1/2): ";
        cin >> pilihan;

        if (pilihan == 1) {
            int n;
            cout << "\n--- MENU 1: Angka 1 ---" << endl;
            cout << "Minta input angka n: ";
            cin >> n;
            
            cout << "Input: " << n << endl;
            for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= n; j++) {
                    if (i == 1 || i == n) {
                        cout << j;
                    } 
                    else {
                        if (j == i - 1) {  
                            cout << 1;
                        } 
                        else {
                            cout << j;
                        }
                    }
                }
                cout << endl;
            }
            
        } else if (pilihan == 2) {
            int n;
            cout << "\n--- MENU 2: Bintang Garis ---" << endl;
            cout << "Minta input angka n: "; 
            cin >> n;
            
            cout << "Input n: " << n << endl; 
            for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= n; j++) {
                    if (i % 2 != 0) {
                        if (j % 2 != 0) { 
                            cout << "*";
                        } 
                        else {
                            cout << "-";
                        }
                    } 
                    else {
                        if (j % 2 != 0) {
                            cout << "-";
                        } 
                        else {
                            cout << "*";
                        }
                    }
                }
                cout << endl;
            }

        } else {
            cout << "Pilihan tidak valid. Silakan coba lagi." << endl;
        }
        cout << "Mau ulangi menu? (y/n): ";
        cin >> ulangi_menu;

    } while (ulangi_menu == 'y' || ulangi_menu == 'Y');

    cout << "Program selesai." << endl;
}

int main(){
	string pass, user, usr, pasw;
	int p, pp, opt;
	user = "admin";
	pass = "12345";
	p = 0;
	pp = 3;
	
	while(p < pp){
		cout << "Username: "; cin >> usr;
		cout << "Password: "; cin >> pasw;
		if (usr == user && pass == pasw) {
            menu();
            break;
        } 
		else {
            p++;
            cout << "Username dan Password salah , Kamu memiliki " << (pp - p) << " percoban lagi.\n";
        }
		}
	
	cout << "Maaf, percobaan login kamu sudah habis. Silahkan coba lagi nanti.\n";
	return 0;
	}

//kak aselii ini susahh 