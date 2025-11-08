#include <iostream>
#include <iomanip>
#include <conio.h>
using namespace std;

int main () {
 int percobaan;
 string Nim, Password;
 string NimBenar = "123456789";
 string PasswordBenar = "2y#99jhi";
 
 while (percobaan < 3) {
  cout << "Masukkan NIM : ";
  cin >> Nim;
  cout << "Masukkan Password : ";
  cin >> Password;
  
  if (Nim == NimBenar && Password == PasswordBenar) {
   cout << "login berhasil" << endl;
 break;
  } else {
   percobaan++;
   cout << "Nim atau Password anda salah, coba lagi!" << endl;
  }
 }
 
 if (!login()) return 0;
 
 int hadir = 0;
 float tugas1, tugas2, tugas3, tugas4;
 float kuis, uts, uas = 0;
 float rata, totalTugas, total;
 char pilih
 bool sudahInput = false;
 
 do {
  cout << "pilih salah satu menu dibawah!\n";
        cout << "1. Input Nilai\n";
        cout << "2. Lihat Nilai dan Rata-rata\n";
        cout << "3. Lihat Grade Nilai\n";
        cout << "4. Keluar\n";
        cout << "Pilih Menu : ";
        cin >> pilih;
        
 switch (pilih) {
  case '1':
   cout << "input nilai\n";
   cout << "Masukkan jumlah kehadiran (0-16): ";
   cin >> hadir;
  
   if (hadir < 0 || hadir > 16) {
    cout << "Input tidak valid!\n";
    getch();
    break;
   }

   cout << "Nilai Tugas 1 : "; cin >> tugas1;
   cout << "Nilai Tugas 2 : "; cin >> tugas2;
   cout << "Nilai Tugas 3 : "; cin >> tugas3;
   cout << "Nilai Tugas 4 : "; cin >> tugas4;
   cout << "Nilai Kuis    : "; cin >> kuis;
   cout << "Nilai UTS     : "; cin >> uts;

   if (hadir < 13) {
    cout << "\nKehadiran di bawah 80%, tidak diperbolehkan mengikuti UAS!\n";
    uas = 0;
   } else {
    cout << "Nilai UAS     : ";
    cin >> uas;
   }

   totalTugas = (tugas1 + tugas2 + tugas3 + tugas4) / 4;
   rata = (totalTugas * 0.15) + (kuis * 0.20) + (uts * 0.30) + (uas * 0.35);
   sudahInput = true;

   cout << "\nData nilai berhasil disimpan!\n";
   getch();
   break;

  case '2':
   if (!sudahInput) {
    cout << "Belum ada data nilai!\n";
   } else {
    cout << "lihat nilai\n";
    cout << fixed << setprecision(2);
    cout << "Kehadiran : " << hadir << " dari 16 kali\n";
    cout << "Rata-rata Nilai : " << rata << endl;
   }
   getch();
   break;

  case '3':
   if (!sudahInput) {
    cout << "Belum ada data nilai!\n";
   } else {
    cout << "frade nilai\n";
    if (rata >= 85) cout << "Grade : A\n";
    else if (rata >= 70) cout << "Grade : B\n";
    else if (rata >= 60) cout << "Grade : C\n";
    else if (rata >= 45) cout << "Grade : D\n";
    else cout << "Grade : E\n";
   }
   getch();
   break;

  case '4':
   cout << "\nKeluar dari program...\n";
   getch();
   break;
   
  default:
   cout << "Pilihan tidak valid!\n";
   getch();
 }

 } while (pilih != '4');

 return 0;
  
}