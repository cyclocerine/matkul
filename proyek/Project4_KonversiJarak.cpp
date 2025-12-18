#include <iostream>
using namespace std;

void konversiJarak(int jarakMiliMeter) {
    int jarakKiloMeter = jarakMiliMeter / 1000000;
    int jarakMeter = (jarakMiliMeter % 1000000) / 1000;
    int jarakSisaMiliMeter = jarakMiliMeter % 1000;
    int jarakCentiMeter = jarakSisaMiliMeter / 10;
    int jarakMiliMeterAkhir = jarakSisaMiliMeter % 10;
    
    cout << jarakMiliMeter << " milimeter sama dengan:" << endl;
    cout << jarakKiloMeter << " kilometer" << endl;
    cout << jarakMeter << " meter" << endl;
    cout << jarakCentiMeter << " centimeter" << endl;
    cout << jarakMiliMeterAkhir << " milimeter" << endl;
}


int main() {
    int jarakMiliMeter;
    cout << "Masukkan jarak dalam milimeter: ";
    cin >> jarakMiliMeter;
    
    konversiJarak(jarakMiliMeter);
    
    return 0;
}
