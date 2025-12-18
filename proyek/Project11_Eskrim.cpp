#include <iostream>
using namespace std;

int main() {
	
int harga;
int rasa;
int topping;
int ukuran;
int jumlah;
int diskon = 0;
string pelanggan;

	cout << "==== Menu ES KRIM ====" ;
	cout << "\n1. Vanilla\t- Rp 10000";
	cout << "\n2. Cokelat\t- Rp 12000";
	cout << "\n3. Stroberi\t- Rp 15000";
	
	cout << "\npilih rasa (1-3) : ";
	cin >> rasa;
	 
	switch (rasa) {
		case 1 : {
			harga = 10000; 
		break;}
		case 2 : {
			harga = 12000;
		break;}
		case 3 : {
			harga = 15000;
		break;}
		default:{
			cout << "input tidak valid";
			return 0;
		}
	}




		cout << "=== PILIH TOPPING ===";
		cout << "\n1. Cokelat Chips\t- Rp 3000";
		cout << "\n2. Kacang Almond\t- Rp 4000";
		cout << "\n3. Oreo Crumbs  \t - Rp 3500";
		cout << "\n4. Tanpa Topping\t- Rp 0";

		cout << "\npilh topping (1-4) : ";
		cin >> topping;

		switch (topping) {
			case 1 : {
				harga += 3000;
			break;}
			case 2 : {
				harga += 4000;
			break;}
			case 3 : {
				harga += 3500;
			break;}
			case 4 : {
				harga += 0;
			break;}
			default:{
			cout << "input tidak valid";
			return 0;
			
			}
			
	}
	cout << "=== PILIH UKURAN CUP ===";
	cout << "\n1. Small\t (harga normal)";
	cout << "\n2. Medium\t (+Rp 2000)";
	cout << "\n3. Large\t (+Rp 5000)";

	cout << "\npilih ukuran cup (1-3) : ";
	cin >> ukuran;

	if (ukuran == 1) {
		harga +=0;
	} else if (ukuran == 2){
		harga += 2000;
	} else if (ukuran == 3){
		harga += 5000;
	}else {
		cout << "input tidak valid";
			return 0;
	}

	cout << "Jumlah Pesanan: ";
	cin >> jumlah;

	harga = harga * jumlah;

	if (harga >= 100000)
	{
		diskon =20;
	}else if (harga >= 50000) {
		diskon = 10;
	}else if (harga >= 30000) {
		diskon =5;
	}else {
		diskon =0;
	}
	cout << "Apakah Pelanggan member? (y/n):";
	cin >> pelanggan;

	if (pelanggan == "y") {
		diskon += 5; 
		

	}
	cout << "=== STRUK PEMBELIAN ===";
	cout << "\nTotal Belanja\t: Rp " << harga;
	cout << "\nDiskon\t       : " << diskon << "%";
	cout << "\nTotal Bayar\t: Rp " << harga-(harga*diskon/100);
	cout << "\nTerimakasih sudah membeli es krim!";



	return 0;


	
}
