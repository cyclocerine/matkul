#include <iostream>
#include <cstdlib>
using namespace std;

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
            cout << "Login Berhasil, Haloo " << user << "!\n";
			cout << "=========" << endl;
			cout << "Menu 1: Angka" << endl;
			cout << "Menu 2: Bintang Garis" << endl;
			cout << "=========" << endl;
			cout << "Pilih Menu: "; cin >> opt;
        } 
		else {
            p++;
            cout << "Username dan Password salah , Kamu memiliki " << (pp - p) << " percoban lagi.\n";
        }
		}
	
	cout << "Maaf, percobaan login kamu sudah habis. Silahkan coba lagi nanti.\n";
	return 0;
	}
