#include <iostream>
#include <string>
#include <cstdlib>
using namespace std;

int main(){
	const string user = "iqq";
	const string pw = "066";
	const int max = 3;
	int coba = 0;
	string username, passw;
	
	
	cout << "Selamat di Halaman Login" << endl;
	while(coba < max){
		cout << "Masukan Username Anda ";cin >> username;
		cout << "\nMasukan Password Anda ";cin >> passw; 
		if(username == user && passw == pw){
			cout << "Login Anda Berhasil" << endl;
			break;
			}
		else{
			system("clear");
			cout << "Username dan Password Salah"<< endl;
			cout << "Kesempatan anda sisa" << max - coba << endl;
			coba ++;
			if(coba >= max){
				cout << "Kesempatan login anda telah habis" << endl;
				return 0;
				}
			}
		}
	}
