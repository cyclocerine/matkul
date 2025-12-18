#include <iostream>
#include <string>
using namespace std;

int main() {
    string username, password;
    int max_attempts = 3;
    int attempts = 1;
    int pilihan;

    string judul_buku[100];
    string pengarang_buku[100];
    int tahun_terbit[100];
    int jumlah_buku = 0;

    cout << "=== Sistem Manajemen Perpustakaan ===" << endl;
    
    do {
        cout << "Masukkan Username: ";
        cin >> username;
        cout << "Masukkan Password: ";
        cin >> password;

        if (username == "faiq" && password == "016") {
            cout << "Login berhasil!" << endl;
            break;
        } else {
            cout << "Username atau Password salah. Coba lagi." << endl;
            attempts++;
        }

        if (attempts > max_attempts) {
            cout << "Terlalu banyak percobaan gagal. Akses ditolak." << endl;
            return 0;
        }
    } while (attempts <= max_attempts);

    while (true) {
        cout << "\nMenu Utama:" << endl;
        cout << "1. Tambah Buku" << endl;
        cout << "2. Lihat Daftar Buku" << endl;
        cout << "3. Hapus Buku" << endl;
        cout << "4. Cari Buku" << endl;
        cout << "5. Keluar" << endl;
        cout << "Pilih menu (1-5): ";
        cin >> pilihan;

        switch (pilihan) {
            case 1: {
                cout << "Mau Input Berapa Buku: ";
                int n;
                cin >> n;
                for (int i = 0; i < n; i++) {
                    if (jumlah_buku >= 100) {
                        cout << "Kapasitas penuh!" << endl;
                        break;
                    }
                    string judul, pengarang;
                    int tahun;
                    
                    cout << "Data ke-" << i + 1 << endl;
                    cout << "Masukkan Judul Buku: ";
                    cin.ignore();
                    getline(cin, judul);
                    
                    cout << "Masukkan Pengarang: ";
                    getline(cin, pengarang);
                    
                    cout << "Masukkan Tahun Terbit: ";
                    cin >> tahun;

                    judul_buku[jumlah_buku] = judul;
                    pengarang_buku[jumlah_buku] = pengarang;
                    tahun_terbit[jumlah_buku] = tahun;
                    jumlah_buku++;
                }
                break;
            }
            case 2: {
                cout << "\nDaftar Buku:" << endl;
                if (jumlah_buku == 0) {
                    cout << "Belum ada buku yang terdaftar." << endl;
                } else {
                    for (int i = 0; i < jumlah_buku; i++) {
                        cout << i + 1 << ". " << judul_buku[i] << " oleh " << pengarang_buku[i] << " (" << tahun_terbit[i] << ")" << endl;
                    }
                }
                break;
            }
            case 3: {
                cout << "\nDaftar Buku:" << endl;
                 for (int i = 0; i < jumlah_buku; i++) {
                    cout << i + 1 << ". " << judul_buku[i] << endl;
                }
                cout << "Masukkan Nomor Urut Buku yang Ingin Dihapus: ";
                int nomor;
                cin >> nomor;
                if (nomor < 1 || nomor > jumlah_buku) {
                    cout << "Nomor buku tidak valid." << endl;
                } else {
                    for (int i = nomor - 1; i < jumlah_buku - 1; i++) {
                        judul_buku[i] = judul_buku[i + 1];
                        pengarang_buku[i] = pengarang_buku[i + 1];
                        tahun_terbit[i] = tahun_terbit[i + 1];
                    }
                    jumlah_buku--;
                    cout << "Buku berhasil dihapus." << endl;
                }
                break;
            }
            case 4: {
                cout << "Masukkan Judul Buku yang Ingin Dicari: ";
                string cari_judul;
                cin.ignore();
                getline(cin, cari_judul);
                bool found = false;
                for (int i = 0; i < jumlah_buku; i++) {
                    if (judul_buku[i] == cari_judul) {
                        cout << "Buku Ditemukan: " << judul_buku[i] << " oleh " << pengarang_buku[i] << " (" << tahun_terbit[i] << ")" << endl;
                        found = true;
                    }
                }
                if (!found) {
                    cout << "Buku tidak ditemukan." << endl;
                }
                break;
            }
            case 5:
                cout << "Terima kasih. Keluar..." << endl;
                return 0;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi." << endl;
        } 
    }
}
