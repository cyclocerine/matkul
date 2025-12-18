/*
    Written by: faiq hammam
    Date: Tuesday 2020-04-07
*/
 
 
#ifndef BIG_INTEGER_H
#define BIG_INTEGER_H
 
 
#include <vector>
#include <string>
#include <initializer_list>
#include <type_traits>
#include <typeinfo>
#include <cassert>
#include <cmath>
#include <functional>
 
 
class BigInt {
private:
    std::vector <char> Digits;
    bool Sign;
public:
    BigInt ();
    template <typename T> BigInt (T);
    BigInt (const std::string&);
    BigInt (const char*);
    template <typename T> BigInt (const std::initializer_list <T>&);
    template <typename T> BigInt (const std::vector <T>&);
    BigInt (const BigInt&);
    BigInt& operator = (const BigInt&);
    BigInt (BigInt&&);
    BigInt& operator = (BigInt&&);
    friend std::ostream& operator << (std::ostream&, const BigInt&);
    friend std::istream& operator >> (std::istream&, BigInt&);
    /* Relational Methods */
    bool operator == (const BigInt&) const;
    bool operator != (const BigInt&) const;
    bool operator <  (const BigInt&) const;
    bool operator >  (const BigInt&) const;
    bool operator <= (const BigInt&) const;
    bool operator >= (const BigInt&) const;
    /* Arithmetic Methods */
    BigInt& operator +=  (const BigInt&);
    BigInt& operator -=  (const BigInt&);
    BigInt& operator *=  (const BigInt&); // DEKLARASI
    BigInt& operator /=  (const BigInt&); // DEKLARASI
    BigInt& operator %=  (const BigInt&); // DEKLARASI
    BigInt& operator &=  (const BigInt&);
    BigInt& operator |=  (const BigInt&);
    BigInt& operator ^=  (const BigInt&);
    BigInt& operator <<= (const BigInt&);
    BigInt& operator >>= (const BigInt&);
    BigInt& operator ++  ();
    BigInt& operator --  ();
    BigInt  operator ++  (int);
    BigInt  operator --  (int);
    BigInt  operator +    () const;
    BigInt  operator -    () const;
    /* Utility Methods */
    const int& operator [] (int) const;
          int& operator [] (int);
    std::vector <int> to_vector (bool) const;
    std::string to_string (bool) const;
    size_t size () const;
    BigInt abs () const;
};
 
 
BigInt::BigInt ()
    : Digits ({0})
    , Sign   (true)
{ }
 
 
template <typename T>
BigInt::BigInt (T Integer)
    : Digits ()
    , Sign   (Integer >= 0) {
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    Sign = Integer >= T(0);
    do {
        int Value = Integer % 10;
        assert(Value >= 0 && Value <= 9);
        Digits.emplace_back(Value);
        Integer /= 10;
    }
    while (Integer != 0);
}
 
 
BigInt::BigInt (const std::string& Integer)
    : Digits ()
    , Sign   (*Integer.begin() != '-') {
    size_t N = Integer.size();
      if (Sign) Digits.resize(N);
    else        Digits.resize(N - 1);
    for (int i = N - 1; i >= !Sign; --i) {
        assert('0' <= Integer [i] && Integer [i] <= '9');
        Digits [N - i - 1] = Integer [i] - '0';
    }
}
 
 
BigInt::BigInt (const char* Integer)
    : BigInt ((std::string)Integer)
{ }
 
 
template <typename T>
BigInt::BigInt (const std::initializer_list <T>& Integer)
    : Digits ()
    , Sign   (*Integer.begin() >= 0) {
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    size_t N = Integer.size();
    Digits.resize(N);
    for (size_t i = 0; i < N; ++i) {
        int Value = std::abs(*(Integer.end() - i - 1));
        assert(Value >= 0 && Value <= 9);
        Digits [i] = Value;
    }
}
 
 
template <typename T>
BigInt::BigInt (const std::vector <T>& Integer)
    : Digits ()
    , Sign   (*Integer.begin() >= 0) {
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    size_t N = Integer.size();
    Digits.resize(N);
    for (size_t i = 0; i < N; ++i) {
        int Value = std::abs(*(Integer.end() - i - 1));
        assert(Value >= 0 && Value <= 9);
        Digits [i] = Value;
    }
}
 
 
BigInt::BigInt (const BigInt& BigInteger)
    : Digits (BigInteger.Digits)
    , Sign   (BigInteger.Sign)
{ }
 
 
BigInt& BigInt::operator = (const BigInt& BigInteger) {
    Digits.assign(BigInteger.Digits.begin(), BigInteger.Digits.end());
    Sign = BigInteger.Sign;
    return *this;
}
 
 
BigInt::BigInt (BigInt&& BigInteger)
    : Digits (std::move(BigInteger.Digits))
    , Sign   (std::move(BigInteger.Sign))
{ }
 
 
BigInt& BigInt::operator = (BigInt&& BigInteger) {
    Digits.assign(BigInteger.Digits.begin(), BigInteger.Digits.end());
    Sign = BigInteger.Sign;
    return *this;
}
 
 
std::ostream& operator << (std::ostream& stream, const BigInt& BigInteger) {
    if (!BigInteger.Sign) stream << '-';
    for (auto Iterator = BigInteger.Digits.rbegin(); Iterator != BigInteger.Digits.rend(); ++Iterator)
        stream << int(*Iterator);
    return stream;
}
 
 
std::istream& operator >> (std::istream& stream, BigInt& BigInteger) {
    std::string Integer;
    stream >> Integer;
    BigInteger = BigInt(Integer);
    return stream;
}
 
 
inline bool BigInt::operator == (const BigInt& R) const {
    if (Sign != R.Sign)
        return false;
    if (Digits.size() != R.Digits.size())
        return false;
    for (size_t i = 0; i < Digits.size(); ++i)
        if (Digits [i] != R.Digits [i])
            return false;
    return true;
}
 
 
inline bool BigInt::operator != (const BigInt& R) const {
    return !(*this == R);
}
 
 
inline bool BigInt::operator < (const BigInt& R) const {
    if (!Sign && R.Sign)
        return true;
    if (Sign && !R.Sign)
        return false;
    if (Sign && R.Sign) {
        if (Digits.size() < R.Digits.size())
            return true;
        else if (Digits.size() > R.Digits.size())
            return false;
        else {
            size_t N = Digits.size();
            for (int i = N - 1; i >= 0; --i) {
                if (Digits [i] > R.Digits [i])
                    return false;
                if (Digits [i] < R.Digits [i])
                    return true;
            }
        }
    }
    else {
        if (Digits.size() < R.Digits.size())
            return false;
        else if (Digits.size() > R.Digits.size())
            return true;
        else {
            size_t N = Digits.size();
            for (int i = N - 1; i >= 0; --i) {
                if (Digits [i] > R.Digits [i])
                    return true;
                if (Digits [i] < R.Digits [i])
                    return false;
            }
        }
    }
    return false;
}
 
 
inline bool BigInt::operator > (const BigInt& R) const {
    return !(*this <= R);
}
 
 
inline bool BigInt::operator <= (const BigInt& R) const {
    return *this < R || *this == R;
}
 
 
inline bool BigInt::operator >= (const BigInt& R) const {
    return *this > R || *this == R;
}
 
 
BigInt& BigInt::operator += (const BigInt& R) {
    size_t MinSize = std::min(Digits.size(), R.Digits.size());
    size_t MaxSize = std::max(Digits.size(), R.Digits.size());
    bool isLesser = *this < R;
    /// Opposite signs
    if (Sign ^ R.Sign) {
        BigInt L;
        bool Swapped = false;
        if (isLesser) {
            if (this->abs() <= R) {
                L = *this;
                *this = R;
                Swapped = true;
            }
            else { /* Nothing to do here. Everything is good! */ }
        }
        else {
            if (*this < R.abs()) {
                L = *this;
                *this = R;
                Swapped = true;
            }
            else { /* Nothing to do here. Everything is good! */ }
        }
        assert(Digits.size() == MaxSize);
 
 
        std::function <void(const BigInt&)> Subtract = [&] (const BigInt& X) {
            size_t i = 0;
            bool Borrow = false;
            for (; i < MinSize; ++i) {
                if (Digits [i] < X.Digits [i])
                    Borrow = true;
                else
                    Borrow = false;
                Digits [i] = (Borrow ? 10 + Digits [i] - X.Digits [i] : Digits [i] - X.Digits [i]);
                if (Borrow) {
                    size_t j = i + 1;
                    while (j < MaxSize) {
                        if (Digits [j] != 0) {
                            --Digits [j];
                            break;
                        }
                        else Digits [j] = 9;
                        ++j;
                    }
                }
            }
        };
 
 
        if (Swapped) Subtract(L);
        else Subtract(R);
 
 
        size_t CountLeadingZeroes = 0;
        for (int i = MaxSize - 1; i > 0; --i)
            if (Digits [i] == 0) ++CountLeadingZeroes;
            else break;
        Digits.resize(MaxSize - CountLeadingZeroes);
    }
    /// Same signs
    else {
        size_t CarryOver = 0, i = 0;
        for (; i < MinSize; ++i) {
            Digits [i] += R.Digits [i] + CarryOver;
            CarryOver = Digits [i] / 10;
            Digits [i] %= 10;
        }
        if (isLesser)
            for (; i < MaxSize; ++i) {
                Digits.emplace_back(R.Digits [i] + CarryOver);
                CarryOver = Digits [i] / 10;
                Digits [i] %= 10;
            }
        else
            for (; i < MaxSize; ++i) {
                Digits [i] += CarryOver;
                CarryOver = Digits [i] / 10;
                Digits [i] %= 10;
            }
        while (CarryOver != 0) {
            Digits.emplace_back(CarryOver % 10);
            CarryOver /= 10;
        }
    }
    return *this;
}
 
 
BigInt& BigInt::operator -= (const BigInt& R) {
    return *this += -R;
}

// ==========================================================
// 🚨 PERBAIKAN: MENAMBAHKAN IMPLEMENTASI OPERATOR PERKALIAN 
//               (HANYA PLACEHOLDER UNTUK MENGATASI LINKER ERROR)
// ==========================================================
BigInt& BigInt::operator *= (const BigInt& R) {
    // 1. Inisialisasi Hasil Sementara dan Ukuran
    size_t N_L = Digits.size();
    size_t N_R = R.Digits.size();
    
    // Hasil perkalian maksimal memiliki N_L + N_R digit
    std::vector<char> Result_Digits(N_L + N_R, 0); 
    
    // 2. Perkalian Inti (Perkalian Sekolah Dasar)
    for (size_t i = 0; i < N_L; ++i) {
        int Carry = 0;
        for (size_t j = 0; j < N_R; ++j) {
            // L[i] * R[j] + Carry Lama + Hasil yang sudah ada di Result[i+j]
            int Prod = Digits[i] * R.Digits[j] + Carry + Result_Digits[i + j];
            
            // Simpan digit baru
            Result_Digits[i + j] = Prod % 10;
            
            // Hitung Carry Baru
            Carry = Prod / 10;
        }
        // Tangani sisa Carry pada posisi i + N_R
        if (Carry > 0) {
            Result_Digits[i + N_R] += Carry;
        }
    }
    
    // 3. Penyesuaian Tanda dan Normalisasi
    
    // Tentukan tanda hasil
    Sign = (Sign == R.Sign);
    
    // Hapus nol tidak signifikan (Leading Zeroes pada representasi terbalik)
    size_t N_Res = Result_Digits.size();
    while (N_Res > 1 && Result_Digits[N_Res - 1] == 0) {
        N_Res--;
    }
    Result_Digits.resize(N_Res);
    
    // Perbarui *this
    Digits = std::move(Result_Digits);
    
    // Kasus khusus: 0 * X = 0
    if (Digits.size() == 1 && Digits[0] == 0) {
        Sign = true;
    }
    
    return *this;
}
// ==========================================================
 
 
BigInt& BigInt::operator ++ () {
    return *this += 1;
}
 
 
BigInt& BigInt::operator -- () {
    return *this -= 1;
}
 
 
BigInt BigInt::operator ++ (int) {
    BigInt Copy = *this;
    ++*this;
    return Copy;
}
 
 
BigInt BigInt::operator -- (int) {
    BigInt Copy = *this;
    --*this;
    return Copy;
}
 
 
BigInt BigInt::operator + () const {
    return *this;
}
 
 
BigInt BigInt::operator - () const {
    BigInt B = *this;
      if (B.Sign && B != 0) B.Sign = false;
    else                    B.Sign = true;
    return B;
}
 
 
std::string BigInt::to_string (bool Original = true) const {
    size_t N = Digits.size();
    std::string S (N, '0');
    for (size_t i = 0; i < N; ++i)
        S [i] = (Original ? Digits [N - i - 1] : Digits [i]) + '0';
    return S;
}
 
 
std::vector <int> BigInt::to_vector (bool Original = true) const {
    size_t N = Digits.size();
    std::vector <int> V (N);
    for (size_t i = 0; i < N; ++i)
        V [i] = (Original ? Digits [N - i - 1] : Digits [i]);
    return V;
}
 
 
inline size_t BigInt::size () const {
    return Digits.size();
}
 
 
inline BigInt BigInt::abs () const {
    if (Sign)
        return *this;
    else
        return -*this;
}
 
 
BigInt operator + (const BigInt& L, const BigInt& R) {
    return BigInt(L) += R;
}
 
 
BigInt operator - (const BigInt& L, const BigInt& R) {
    return BigInt(L) -= R;
}
 
#endif /* BIG_INTEGER_H */