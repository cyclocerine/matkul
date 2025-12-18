/*
 * arrays.cxx
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
#include <string>
using namespace std;

int main()
{
	int baris, kolom, barism, kolomm;
	cout << "Masukan Jumlah  Baris Matrix: ";cin >> baris;
	cout << "\nMasukan Jumlah Kolom Matrix: ";cin >> kolom;
	cout << "Masukan nilai Matrix\n";
	int matA[baris][kolom];
	
	for(barism = 0; barism < baris; barism++){
		for(kolomm = 0; kolomm < kolom; kolomm++){
			cout << "[" << barism << "]" << "[" << kolomm << "] : ";cin >> matA[barism][kolomm];
			}
		}
	
	cout << "Tampilan\n";
	
	for(barism = 0; barism < baris; barism++){
		for(kolomm = 0; kolomm < kolom; kolomm++){
			cout << "|"<<matA[barism][kolomm] << "|";
			}
			cout << endl;
		}
	return 0;
}

