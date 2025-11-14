/*
 * hadeuh.cxx
 * 
 * Copyright 2025 FAIQ HAMMAM <CYCLOCERINE>
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
using namespace std;

int main()
{
	int nilai[5];
	cout << "======Program Cek Kelulusan Mahasiswa======\n";
	for(int i = 0; i < 5; i++){
		cout << "Masukan Nilai Mahasiswa Ke-"<< i + 1 << " :";cin >> nilai[i];
		}
	cout << "Mahasiswa yang Lulus: ";
	for(int i=0; i<5; i++){
		if(nilai[i] >= 75){
			cout << nilai[i] << " ";
			}
		}
	cout << "\nMahasiswa yang tidak lulus: ";
	for(int i=0; i<5; i++){
		if(nilai[i] < 75){
			cout << nilai[i] << " ";
			}
		}
	return 0;
}

