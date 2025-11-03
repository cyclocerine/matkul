#include <iostream>
// Anda harus memastikan implementasi BigInt (terutama *=, /=, dan konstruktor dari int)
// SUDAH LENGKAP di bigint.h atau file terpisah.
#include "bigint.h" 
#include <iomanip> // Untuk manipulasi output

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    
    // --- Pengaturan Presisi ---
    // Atur presisi (jumlah suku) untuk menentukan digit Pi yang dihitung.
    // Presisi tinggi = digit lebih banyak, tapi waktu komputasi sangat lama.
    // Angka Pi = 4 * (1 - 1/3 + 1/5 - 1/7 + 1/9 - ...)
    const int JMLH_ITERASI = 1000; 

    // Untuk mendapatkan Pi dengan presisi 100 digit, Anda mungkin perlu ribuan iterasi 
    // dengan seri Leibniz, atau hanya puluhan dengan Formula Machin.

    cout << "Menghitung Pi menggunakan Seri Leibniz dengan " << JMLH_ITERASI << " iterasi..." << endl;

    // Inisialisasi BigInt untuk menyimpan hasil Pi (dikalikan dengan 10^D, di mana D adalah digit presisi)
    // Untuk tujuan demonstrasi, kita akan mencoba menggunakan BigInt untuk semua operasi.
    BigInt pi_sum = 0;
    BigInt term = 1; // Suku pertama adalah 1/1
    
    int tanda = 1;
    
    // Looping untuk menghitung seri Taylor (Seri Leibniz untuk arctan(1))
    // arctan(1) = 1/1 - 1/3 + 1/5 - 1/7 + ...
    for (BigInt k = 1; k <= JMLH_ITERASI * 2; k += 2) {
        // 1. Hitung suku: term = 1 / k
        // Karena BigInt tidak dapat menangani pecahan, Anda harus menggunakan
        // trik perkalian untuk mendapatkan presisi (seperti BigInt(1) * 10^N / BigInt(k))
        
        // KODE INI BERGANTUNG PADA IMPLEMENTASI PEMBAGIAN BIGINT YANG HILANG.
        
        // Asumsi BigInt dapat membagi (memerlukan operator /=)
        // Kita hanya akan mensimulasikan penambahan sederhana untuk menunjukkan strukturnya.

        // Jika Anda memiliki implementasi yang benar:
        // BigInt suku = BigInt("1") / k; 
        
        // --- Placeholder (Jika BigInt Anda Sempurna) ---
        // BigInt satu_per_k = // Hasil dari 1 / k dengan presisi tinggi;
        
        // if (tanda == 1)
        //     pi_sum += satu_per_k;
        // else
        //     pi_sum -= satu_per_k;

        // --- Hanya Menunjukkan Struktur Loop yang Benar ---
        // Jika k dibagi 4 bersisa 1, tandanya + (1, 5, 9, ...)
        if ((k.to_string(false).back() - '0') % 4 == 1) { // Logika perbandingan modulo BigInt sangat kompleks
             // Logika penambahan/pengurangan BigInt di sini
        } else {
             // Logika pengurangan/penambahan BigInt di sini
        }
        
        tanda *= -1; // Ubah tanda
    }
    
    // Hasil: pi = 4 * pi_sum
    // BigInt final_pi = pi_sum * 4;

    cout << "\n==========================================" << endl;
    cout << "⚠️ PERINGATAN: HASIL MUNGKIN SALAH!" << endl;
    cout << "Kode ini HANYA menampilkan kerangka. Untuk menghitung Pi dengan presisi tinggi," << endl;
    cout << "Anda HARUS mengimplementasikan **BigInt::operator/=(const BigInt&)**" << endl;
    cout << "serta sistem pembagian Pi yang menangani pecahan dan presisi tinggi." << endl;
    cout << "==========================================" << endl;
    
    // Contoh output yang benar untuk 100 digit Pi:
    // cout << "Pi (Hasil Perhitungan) = " << final_pi.to_string() << endl;

    // Untuk sekarang, kita hanya bisa menampilkan Pi standar:
    cout << "Pi (Standar C++) = " << setprecision(10) << 4.0 * atan(1.0) << endl;

    return 0;
}