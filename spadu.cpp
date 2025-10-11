#include <iostream>
#include <iomanip>
using namespace std;

double hitungRataTugas(double t1, double t2, double t3, double t4) {
    return (t1 + t2 + t3 + t4) / 4.0;
}

char hitungGrade(double total) {
    if (total >= 85.0) return 'A';
    if (total >= 70.0) return 'B';
    if (total >= 60.0) return 'C';
    if (total >= 45.0) return 'D';
    return 'E';
}

void garis(int n = 60) {
    for (int i = 0; i < n; ++i) cout << '=';
    cout << '\n';
}

int main() {
    const string VALID_NIM = "123250001";
    const string VALID_PASS = "admin123";

    string nim, pass;
    int attempts = 0;
    const int MAX_ATTEMPTS = 3;

    cout << fixed << setprecision(2);
    garis();
    cout << setw(36) << right << "SELAMAT DATANG DI SPADU" << '\n';
    garis();
    cout << "\n-- Silakan Login --\n";

    while (attempts < MAX_ATTEMPTS) {
        cout << "NIM    : "; cin >> nim;
        cout << "Password: "; cin >> pass;

        if (nim == VALID_NIM && pass == VALID_PASS) {
            cout << "\nLogin sukses. Selamat datang, mahasiswa NIM " << nim << "!\n\n";
            break;
        } else {
            attempts++;
            cout << "NIM atau Password salah. Kesempatan tersisa: " << (MAX_ATTEMPTS - attempts) << '\n';
            if (attempts >= MAX_ATTEMPTS) {
                cout << "\nKesempatan habis. Anda akan keluar dari sistem.\n";
                return 0;
            }
        }
    }

    int pilihan = 0;
    int hadir = 0;               
    double tugas1 = 0, tugas2 = 0, tugas3 = 0, tugas4 = 0;
    double kuis = 0, uts = 0, uas = 0;
    bool nilai_diinput = false;
    bool bolehUAS = true;

    const int TOTAL_PERTEMUAN = 16;
    while (true) {
        garis();
        cout << "Menu SPADU\n";
        cout << "1. Input Nilai\n";
        cout << "2. Lihat Nilai & Rata-rata\n";
        cout << "3. Lihat Grade\n";
        cout << "4. Reset Data Nilai (hapus)\n";
        cout << "5. Keluar\n";
        cout << "Pilih (1-5): ";
        cin >> pilihan;
        cout << '\n';

        if (pilihan == 1) {
            cout << "-- Input Nilai Mahasiswa --\n";
            do {
                cout << "Masukkan jumlah kehadiran (0 - " << TOTAL_PERTEMUAN << "): ";
                cin >> hadir;
                if (hadir < 0 || hadir > TOTAL_PERTEMUAN) {
                    cout << "Input tidak valid. Coba lagi.\n";
                } else break;
            } while (true);

            double hadirPercent = (static_cast<double>(hadir) / TOTAL_PERTEMUAN) * 100.0;
            cout << "Kehadiran: " << hadir << " / " << TOTAL_PERTEMUAN << " (" << hadirPercent << "%)\n";
            if (hadirPercent < 80.0) {
                bolehUAS = false;
                cout << "Perhatian: Kehadiran kurang dari 80%. Anda TIDAK diizinkan mengikuti UAS.\n";
                cout << "(Sistem akan mengisi nilai UAS = 0 otomatis)\n";
                uas = 0.0;
            } else {
                bolehUAS = true;
            }

            cout << "\nMasukkan nilai (0 - 100). Jika tidak ada, masukkan 0.\n";
            cout << "Tugas 1: "; cin >> tugas1;
            cout << "Tugas 2: "; cin >> tugas2;
            cout << "Tugas 3: "; cin >> tugas3;
            cout << "Tugas 4: "; cin >> tugas4;
            cout << "Nilai Kuis: "; cin >> kuis;
            cout << "Nilai UTS: "; cin >> uts;
            if (bolehUAS) {
                cout << "Nilai UAS: "; cin >> uas;
            }

            nilai_diinput = true;
            cout << "\nInput nilai selesai.\n";

        } else if (pilihan == 2) {
            if (!nilai_diinput) {
                cout << "Belum ada data nilai. Silakan pilih menu 1 untuk input nilai terlebih dahulu.\n";
                continue;
            }

            cout << "-- Rekap Nilai --\n";
            cout << left << setw(20) << "Kehadiran" << ": " << hadir << " / " << TOTAL_PERTEMUAN;
            double hadirPercent = (static_cast<double>(hadir) / TOTAL_PERTEMUAN) * 100.0;
            cout << " (" << hadirPercent << "%)\n";

            cout << left << setw(20) << "Tugas 1" << ": " << tugas1 << '\n';
            cout << left << setw(20) << "Tugas 2" << ": " << tugas2 << '\n';
            cout << left << setw(20) << "Tugas 3" << ": " << tugas3 << '\n';
            cout << left << setw(20) << "Tugas 4" << ": " << tugas4 << '\n';
            cout << left << setw(20) << "Rata-rata Tugas" << ": " << hitungRataTugas(tugas1,tugas2,tugas3,tugas4) << '\n';
            cout << left << setw(20) << "Kuis" << ": " << kuis << '\n';
            cout << left << setw(20) << "UTS" << ": " << uts << '\n';
            if (!bolehUAS) {
                cout << left << setw(20) << "UAS" << ": " << uas << " (Diblokir karena kehadiran < 80%)\n";
            } else {
                cout << left << setw(20) << "UAS" << ": " << uas << '\n';
            }

            double rataTugas = hitungRataTugas(tugas1,tugas2,tugas3,tugas4);
            double totalNilai =
                (rataTugas * 0.15) +
                (kuis * 0.20) +
                (uts * 0.30) +
                (uas * 0.35);

            cout << "\n" << left << setw(20) << "Rata-rata Akhir" << ": " << totalNilai << '\n';

        } else if (pilihan == 3) {
            if (!nilai_diinput) {
                cout << "Belum ada data nilai. Silakan pilih menu 1 untuk input nilai terlebih dahulu.\n";
                continue;
            }
            double rataTugas = hitungRataTugas(tugas1,tugas2,tugas3,tugas4);
            double totalNilai =
                (rataTugas * 0.15) +
                (kuis * 0.20) +
                (uts * 0.30) +
                (uas * 0.35);

            char grade = hitungGrade(totalNilai);
            cout << "-- Hasil Grade --\n";
            cout << "Rata-rata akhir : " << totalNilai << '\n';
            cout << "Grade           : " << grade << '\n';
            cout << "\nKetentuan grade:\n";
            cout << "A = 85+\nB = 70 - 84\nC = 60 - 69\nD = 45 - 59\nE = < 45\n";

        } else if (pilihan == 4) {
            tugas1 = tugas2 = tugas3 = tugas4 = kuis = uts = uas = 0.0;
            hadir = 0;
            nilai_diinput = false;
            bolehUAS = true;
            cout << "Data nilai telah direset.\n";

        } else if (pilihan == 5) {
            cout << "Anda memilih keluar. Terima kasih telah menggunakan SPADU.\n";
            break;
        } else {
            cout << "Pilihan tidak valid. Silakan pilih 1-5.\n";
        }
    }

    return 0;
}
