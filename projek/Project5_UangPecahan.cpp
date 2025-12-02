#include <iostream>
using namespace std;
void banyakPecahan(long uang, long pecahan[]);

int main(){
  long uang,pecahan[9] = {50000,20000,10000,5000,2000,1000,500,200,100};
  cout << "Jumlah Uang Kembali : Rp "; cin >> uang;cout << "Pecahan uang kembali: " << endl;
  banyakPecahan(uang,pecahan);
}

void banyakPecahan(long uang, long pecahan[]){
  int i,lembar[9];
  for(i=0;i<9;i++){
    lembar[i] = uang/pecahan[i];
    uang = uang - (lembar[i] * pecahan[i]);
    cout << pecahan[i] << " : " << lembar[i] << " lembar" << endl;
  }
}