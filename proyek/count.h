#include <cmath>
using namespace std;


//bangun datar
float luasPersegi(float sisi) {
    return sisi * sisi;
}
float luasPersegiPanjang(float panjang, float lebar) {
    return panjang * lebar;
}
float luasLingkaran(float radius) {
    return M_PI * radius * radius;
}
float luasSegitiga(float alas, float tinggi) {
    return 0.5 * alas * tinggi;
}
float jajargenjang(float alas, float tinggi) {
    return alas * tinggi;
}
float belahKetupat(float d1, float d2) {
    return 0.5 * d1 * d2;
}
float trapesium(float a, float b, float tinggi) {
    return 0.5 * (a + b) * tinggi;
}
float layangLayang(float d1, float d2) {
    return 0.5 * d1 * d2;
}

//bangun ruang
float volumeKubus(float sisi) {
    return sisi * sisi * sisi;
}
float volumeBalok(float panjang, float lebar, float tinggi) {   
    return panjang * lebar * tinggi;
}
float volumeTabung(float radius, float tinggi) {
    return M_PI * radius * radius * tinggi;
}
float volumeKerucut(float radius, float tinggi) {
    return (1.0/3.0) * M_PI * radius * radius * tinggi;
}
float volumeBola(float radius) {
    return (4.0/3.0) * M_PI * radius * radius * radius;
}
float volumePrisma(float luasAlas, float tinggi) {
    return luasAlas * tinggi;
}
float volumeLimas(float luasAlas, float tinggi) {
    return (1.0/3.0) * luasAlas * tinggi;
}
