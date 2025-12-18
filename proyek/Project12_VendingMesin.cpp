//simulasi vending machine sederhana dengan bahasa indonesia
#include <iostream>
#include <string>
#include <iomanip>
#include <cstdio>
using namespace std;

struct Item {
    string name;
    double price;
    int stock;
};

int main(){
    Item items[] = {
        {"Air Mineral", 3000, 10},
        {"Teh Botol", 5000, 8},
        {"Kopi Sachet", 4000, 15},
        {"Roti", 7000, 5}
    };
    const int itemCount = sizeof(items) / sizeof(items[0]);
    double balance = 0.0;
    int choice;
    cout << fixed << setprecision(2);
    while(true){
        cout << "\n-- Mesin Vending --\n";
        cout << "1. Tampilkan Item\n2. Tambah Saldo\n3. Beli Item\n4. Keluar\nPilihan Anda: ";
        cin >> choice;
        if(choice == 1){
            cout << "\n-- Daftar Item --\n";
            for(int i = 0; i < itemCount; i++){
                cout << i+1 << ". " << items[i].name << " - Rp " << items[i].price << " (Stok: " << items[i].stock << ")\n";
            }
            cout << "Saldo Anda: Rp " << balance << "\n";
        } else if(choice == 2){
            double amount;
            cout << "Masukkan jumlah saldo yang ingin ditambahkan: Rp ";
            cin >> amount;
            if(amount > 0){
                balance += amount;
                cout << "Saldo berhasil ditambahkan. Saldo Anda sekarang: Rp " << balance << "\n";
            } else {
                cout << "Jumlah tidak valid.\n";
            }
        } else if(choice == 3){
            int itemNumber;
            cout << "Masukkan nomor item yang ingin dibeli: ";
            cin >> itemNumber;
            if(itemNumber < 1 || itemNumber > itemCount){
                cout << "Nomor item tidak valid.\n";
                continue;
            }
            Item &selectedItem = items[itemNumber - 1];
            if(selectedItem.stock <= 0){
                cout << "Maaf, item ini sedang habis.\n";
                continue;
            }
            if(balance < selectedItem.price){
                cout << "Saldo tidak cukup untuk membeli item ini.\n";
                continue;
            }
            balance -= selectedItem.price;
            selectedItem.stock--;
            cout << "Anda telah membeli " << selectedItem.name << ". Sisa saldo Anda: Rp " << balance << "\n";
        } else if(choice == 4){
            cout << "Terima kasih telah menggunakan mesin vending. Sampai jumpa!\n";
            break;
        } else {
            cout << "Pilihan tidak valid. Silakan coba lagi.\n";
        }
    }
    return 0;
}