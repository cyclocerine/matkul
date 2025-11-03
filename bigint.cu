#include <iostream>
#include "bigint.h"
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    cout.precision(10);
    cout << fixed;// << boolalpha;
 
    BigInt A = "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999";
 
    for (int i = 0; i < 1e5; ++i)
        A += A;

 
    cout << A << endl;
 
    return 0;
}
