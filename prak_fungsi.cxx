#include <iostream>
#include <string>
#include <cstdlib>
#include <cmath>

using namespace std;
double volume_tabung(float r, float t);
double volume_kerucut(float r, float t);
void segitiga(float alas, float tinggi);
void panjang(float panjang, float lebar);
void cariTerbesarTerkecil(int a, int b, int c, int& terbesar, int& terkecil);


int main(){
	int opt;
	
	while(true){
		system("clear");
		cout << "\nProgram untuk menghitung volume";
		cout << "\n1. Volume Tabung";
		cout << "\n2. Volume Kerucut";
		cout << "\n3. Keliling Dan luas Segitiga";
		cout << "\n4. Keliling dan luas persegi panjang";
		cout << "\n5. Mencari bilangan Terbesar dan terkecil";
		cout << "\npilih opsi";
		cin >> opt;
		if(opt == 1){
			system("clear");
			float r, t;
			cout << "\nmasukan nilai r "; cin >> r;
			cout << "\nmasukan nilai t "; cin >> t;
			cout << "\nVolume Tabung adlah "<< volume_tabung(r, t);
			cout << endl;
			}
		else if(opt == 2){
			system("clear");
			float r, t;
			cout << "\nmasukan nilai r "; cin >> r;
			cout << "\nmasukan nilai t "; cin >> t;
			cout << "\nVolume kerucut adlah "<< volume_kerucut(r, t);
			cout << endl;
			}
		else if(opt == 3){
			system("clear");
			float a, t;
			cout << "\nmasukan nilai a "; cin >> a;
			cout << "\nmasukan nilai t "; cin >> t;
			segitiga(a, t);
			cout << endl;
			}
		else if(opt == 4){
			system("clear");
			float p, l;
			cout << "\nmasukan nilai r "; cin >> p;
			cout << "\nmasukan nilai t "; cin >> l;
			panjang(p, l);
			cout << endl;
			}
		else if(opt == 5){
			int a, b, c, maxVal, minVal;
			cout << "\nMasukan Angka Ke-1 ";cin >> a;
			cout << "\nMasukan Angka Ke-2 ";cin >> b;
			cout << "\nMasukan Angka Ke-3 ";cin >> c;
			cariTerbesarTerkecil(a, b, c, maxVal, minVal);
			cout << "\nHasil perbandingan dari " << a << ", " << b << ", dan " << c << ":\n";
    		cout << "Bilangan **Terbesar** adalah: **" << maxVal << "**\n";
    		cout << "Bilangan **Terkecil** adalah: **" << minVal << "**\n";
			cout << endl;
			}
		else{
			cout << "input tidak valid";
			}
		}
	
	}
	
double volume_tabung(float r, float t){
	double volume = M_PI * r * r * t;
	return volume;
	}
	
double volume_kerucut(float r, float t){
	double volume = 0.333333 * M_PI * r * r * t;
	return volume;
	}
	
void segitiga(float alas ,float tinggi){
	double luas = 0.5 * alas * tinggi;
	double sisiMiring = sqrt((alas * alas) + (tinggi * tinggi));
	double keliling = alas + sisiMiring + tinggi;
	cout << "\nLuas segitiga adalah " << luas <<" dan keliling nya adalah "<< keliling; 
	}

void panjang(float panjang, float lebar){
	double luas = panjang * lebar;
	double keliling = 2 * (panjang + lebar);
	cout << "\nLuas persegi panjang adalah " << luas <<" dan keliling nya adalah "<< keliling;
	}

void cariTerbesarTerkecil(int a, int b, int c, int& terbesar, int& terkecil) {
    terbesar = a;
    terkecil = a;
    if (b > terbesar) {
        terbesar = b;
    }
    if (c > terbesar) {
        terbesar = c;
    }

    if (b < terkecil) {
        terkecil = b;
    }
    if (c < terkecil) {
        terkecil = c;
    }
}
