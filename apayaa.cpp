/*
 * apaya.cxx
 * 
 * Copyright 2025 PC PRAKTIKUM <PC PRAKTIKUM@DESKTOP-4D025JM>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */


#include <iostream>
#include <string>
using namespace std;
void perbandingan(int nilai1, int nilai2);
void tukar()
struct mahasiswa{
	string nama;
	int nilai;
	};
mahasiswa mhs[2];

int main()
{
	char opt;
	cout << "===== Input Data Mahasiswa =====\n";
	for(int i = 0; i < 2; i++){
		cout << "Masukan Nama Mahasiswa ke-" << i + 1 << ": ";cin >> mhs[i].nama;
		cout << "Masukan Nilai " << mhs[i].nama << " : ";cin >> mhs[i].nilai;
		}
	cout << "\n====================================================================\n";
	perbandingan(mhs[0].nilai, mhs[1].nilai);
	cout << "\n====================================================================\n";
	cout << "Apakah Anda Ingin Menukar Posisi (y/n): ";cin>>opt;
	if(opt == y){
		tukar(mhs[0], mhs[1]);
		}
	else if(opt==n){
		return 0;
		}
	return 0;
}

void perbandingan(int nilai1, int nilai2){
	if(nilai1 > nilai2){
		cout << mhs[0].nama << " Memiliki nilai lebih tinggi (" << mhs[0].nilai << ") dari " << mhs[1].nama << " ("<< mhs[1].nilai << ")"<< endl;
		}
	else if(nilai1 < nilai2){
		cout << mhs[1].nama << " Memiliki nilai lebih tinggi (" << mhs[1].nilai << ") dari " << mhs[0].nama << " ("<< mhs[0].nilai << ")" << endl;
		}
	}

void tukar(mahasiswa mhs1,  mahasiswa mhs2){
	mahasiswa temp[2];
	temp[1] = mhs1;
	temp[0] = mhs2;
	
	cout << "Data Akhir\n";
	cout << "1. " << temp[0].nama << " - " << temp[0].nilai << endl;
	cout << "2. " << temp[1].nama << " - " << temp[1].nilai << endl;
	}
