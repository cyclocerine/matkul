/*
 * apaya.cxx
 * * Copyright 2025 PC PRAKTIKUM <PC PRAKTIKUM@DESKTOP-4D025JM>
 * * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * * */


#include <iostream>
#include <string>
using namespace std;

// Forward declaration untuk struct mahasiswa
struct mahasiswa;

// ---- PROTOTYPE FUNGSI ----
void perbandingan(int nilai1, int nilai2);
// PERBAIKAN: Prototype 'tukar' harus di-uncomment agar bisa dipanggil di main
void tukar(mahasiswa mhs1,  mahasiswa mhs2); 

// ---- DEFINISI STRUCT ----
struct mahasiswa{
    string nama;
    int nilai;
    };

// ---- VARIABEL GLOBAL ----
//deklarasi array of struct 
mahasiswa mhs[2];

// ---- FUNGSI UTAMA ----
int main()
{
    char opt;
    cout << "===== Input Data Mahasiswa =====\n";
    for(int i = 0; i < 2; i++){
        cout << "Masukan Nama Mahasiswa ke-" << i + 1 << ": ";cin >> mhs[i].nama;
        cout << "Masukan Nilai " << mhs[i].nama << " : ";cin >> mhs[i].nilai;
        }
    cout << "\n====================================================================\n";
    
    // Memanggil fungsi perbandingan dengan nilai dari array global
    perbandingan(mhs[0].nilai, mhs[1].nilai);
    
    cout << "\n====================================================================\n";
    cout << "Apakah Anda Ingin Menukar Posisi (y/n): ";cin>>opt;
    
    // PERBAIKAN: Gunakan 'y' (char) bukan y (variabel)
    if(opt == 'y'){
        tukar(mhs[0], mhs[1]);
        }
    // PERBAIKAN: Gunakan 'n' (char) bukan n (variabel)
    else if(opt=='n'){
        cout << "Program selesai." << endl;
        return 0;
        }
    else {
        cout << "Pilihan tidak valid. Program selesai." << endl;
    }
    return 0;
}

// ---- IMPLEMENTASI FUNGSI ----

void perbandingan(int nilai1, int nilai2){
    // Catatan: Fungsi ini menggunakan variabel global 'mhs', 
    // bukan parameter 'nilai1' dan 'nilai2' yang dikirim.
    // Ini berhasil, tapi sedikit membingungkan.
    
    if(mhs[0].nilai > mhs[1].nilai){
        cout << mhs[0].nama << " Memiliki nilai lebih tinggi (" << mhs[0].nilai << ") dari " << mhs[1].nama << " ("<< mhs[1].nilai << ")"<< endl;
        }
    else if(mhs[0].nilai < mhs[1].nilai){
        cout << mhs[1].nama << " Memiliki nilai lebih tinggi (" << mhs[1].nilai << ") dari " << mhs[0].nama << " ("<< mhs[0].nilai << ")" << endl;
        }
    // TAMBAHAN: Menangani jika nilai sama
    else {
        cout << mhs[0].nama << " dan " << mhs[1].nama << " memiliki nilai yang sama (" << mhs[0].nilai << ")" << endl;
    }
}

void tukar(mahasiswa mhs1,  mahasiswa mhs2){
    // PENTING: Ini hanya menukar SALINAN (copy) dari mhs1 dan mhs2.
    // Array 'mhs' global yang asli TIDAK berubah.
    // Ini disebut "Pass-by-Value".
    
    mahasiswa temp[2];
    temp[1] = mhs1; // mhs1 adalah salinan dari mhs[0]
    temp[0] = mhs2; // mhs2 adalah salinan dari mhs[1]
    
    cout << "Data Akhir (Posisi Ditukar SEMENTARA):\n";
    cout << "1. " << temp[0].nama << " - " << temp[0].nilai << endl; // Menampilkan salinan mhs[1]
    cout << "2. " << temp[1].nama << " - " << temp[1].nilai << endl; // Menampilkan salinan mhs[0]
    }