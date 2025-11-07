#include <iostream>
using namespace std;

void konversiJarak(int jarakMiliMeter){
    int jarakKilometer = jarakMiliMeter / 1000000.0;
    int jarakSentimeter = jarakMiliMeter / 10.0;
    int jarakMeter = jarakMiliMeter / 1000.0;
    int jarakmiliMeterOutput = jarakMiliMeter;
 
    cout << "Hasil Konversi: " << jarakKilometer << " km" << ", " << jarakMeter << " m" << ", " 
    << jarakSentimeter << " cm, "<< jarakmiliMeterOutput << " mm" << endl;
    
}


int main() {
    int jarakMiliMeter;
    cout << "Masukkan jarak dalam milimeter: ";
    cin >> jarakMiliMeter;
    
    konversiJarak(jarakMiliMeter);
    
    return 0;
}
