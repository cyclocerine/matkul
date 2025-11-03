/*
    Written by: Aryan V S
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
    /**
     * std::vector that stores the digits of a Big Integer
     * Least significant digits stored first
     *
     * A digit 'Digits [i]' is not stored as it's ASCII value (as expected in
     * a vector of char) i.e. '1' is stored simply as 1 instead of it's ASCII
     * value 49. This is done to make arithmetic operations faster. When the
     * actual character value is needed (like in the to_string() method), simply
     * '0' is added in each step of conversion
     */
    std::vector <char> Digits;
    /**
     * std::bool that stores the sign of a Big Integer
     * false -> negative
     * true  -> non-negative
     */
    bool Sign;
public:
    /**
     * Constructs a Big Integer with default values
     *   Sign: true
     * Number: 0
     */
    BigInt ();
    /**
     * Constructs a Big Integer from primitive integer types
     */
    template <typename T> BigInt (T);
    /**
     * Constructs a Big Integer from a string
     * Valid:
     *   -> "-...." (negative)
     *   -> "....." (non-negative)
     */
    BigInt (const std::string&);
    BigInt (const char*);
    /**
     * Constructs a Big Integer from std::initialzer_list
     * Valid:
     *   -> {-a,b,c,...} (negative)
     *   -> {a,b,c,....} (non-negative)
     * All integers must be in the range [0,9]
     */
    template <typename T> BigInt (const std::initializer_list <T>&);
    /**
     * Constructs a Big Integer from std::vector
     * Valid:
     *   -> {-a,b,c,...} (negative)
     *   -> {a,b,c,....} (non-negative)
     * All integers must be in the range [0,9]
     */
    template <typename T> BigInt (const std::vector <T>&);
    /**
     * Copy Constructor
     */
    BigInt (const BigInt&);
    /**
     * Copy Assignment
     */
    BigInt& operator = (const BigInt&);
    /**
     * Move Constructor
     */
    BigInt (BigInt&&);
    /**
     * Move Assignment
     */
    BigInt& operator = (BigInt&&);
    /**
     * Output stream overload
     */
    friend std::ostream& operator << (std::ostream&, const BigInt&);
    /**
     * Input stream overload
     */
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
    BigInt& operator *=  (const BigInt&);
    BigInt& operator /=  (const BigInt&);
    BigInt& operator %=  (const BigInt&);
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
    /**
     * Accessing digits
     */
    const int& operator [] (int) const;
          int& operator [] (int);
    /**
     * to_vector: Returns a vector containing the digits. If parameter is false, default order returned.
     *            If parameter is true, reversed order returned (i.e. most significant digits start first).
     *            Default order is the order originally stored i.e. from LSD to MSD
     */
    std::vector <int> to_vector (bool) const;
    /**
     * to_string: Returns a string containing the digits. If parameter is false, default order returned.
     *            If parameter is true, reversed order returned (i.e. most significant digits start first).
     *            Default order is the order originally stored i.e. from LSD to MSD
     */
    std::string to_string (bool) const;
    /**
     * size: Returns the number of digits in the Big Integer
     */
    size_t size () const;
    /**
     * abs: Returns the absolute value of the Big Integer
     */
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
    /// Only types like int, long long, etc are allowed
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    Sign = Integer >= T(0);
    do {
        int Value = Integer % 10;
        /// Types like char, wchar_t, etc fail the assertion
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
    /// Only types like int, long long, etc are allowed
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    size_t N = Integer.size();
    Digits.resize(N);
    for (size_t i = 0; i < N; ++i) {
        int Value = std::abs(*(Integer.end() - i - 1));
        /// Types like char, wchar_t, etc fail the assertion
        assert(Value >= 0 && Value <= 9);
        Digits [i] = Value;
    }
}
 
 
template <typename T>
BigInt::BigInt (const std::vector <T>& Integer)
    : Digits ()
    , Sign   (*Integer.begin() >= 0) {
    /// Only types like int, long long, etc are allowed
    static_assert(std::is_integral <T>::value, "Construction requires Integer types");
    size_t N = Integer.size();
    Digits.resize(N);
    for (size_t i = 0; i < N; ++i) {
        int Value = std::abs(*(Integer.end() - i - 1));
        /// Types like char, wchar_t, etc fail the assertion
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
    /// If numbers have different sign, they cannot be equal
    if (Sign != R.Sign)
        return false;
    /// If the number of digits in the two numbers is different, they cannot be equal
    if (Digits.size() != R.Digits.size())
        return false;
    /// The number are of same sign and have the same number of digits
    /// To test for equality, each digit must be same
    for (size_t i = 0; i < Digits.size(); ++i)
        if (Digits [i] != R.Digits [i])
            return false;
    return true;
}
 
 
inline bool BigInt::operator != (const BigInt& R) const {
    return !(*this == R);
}
 
 
inline bool BigInt::operator < (const BigInt& R) const {
    /// First is -ve, Second is non -ve
    if (!Sign && R.Sign)
        return true;
    /// First is non -ve, Second is -ve
    if (Sign && !R.Sign)
        return false;
    /// Both are non -ve
    if (Sign && R.Sign) {
        /// First is less than Second in terms of number of digits
        if (Digits.size() < R.Digits.size())
            return true;
        /// First is greater than Second in terms of number of digits
        else if (Digits.size() > R.Digits.size())
            return false;
        /// First and second have the same number of digits
        else {
            size_t N = Digits.size();
            /// Start check from MSD
            for (int i = N - 1; i >= 0; --i) {
                if (Digits [i] > R.Digits [i])
                    return false;
                if (Digits [i] < R.Digits [i])
                    return true;
            }
        }
    }
    /// Both are -ve
    else {
        if (Digits.size() < R.Digits.size())
            return false;
        else if (Digits.size() > R.Digits.size())
            return true;
        else {
            size_t N = Digits.size();
            /// Start check from MSD
            for (int i = N - 1; i >= 0; --i) {
                if (Digits [i] > R.Digits [i])
                    return true;
                if (Digits [i] < R.Digits [i])
                    return false;
            }
        }
    }
    /// All digits are same
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
        /// Case: Left(L:(-ve)), Right(R:(+ve))
        if (isLesser) {
            /// Case: If abs(L) is lesser or equal to R, sum is non -ve
            if (this->abs() <= R) {
                L = *this;
                *this = R;
                Swapped = true;
            }
            /// Case: If abs(L) is greater than R, sum is -ve
            else { /* Nothing to do here. Everything is good! */ }
        }
        /// Case: Left(+ve), Right(-ve)
        else {
            /// Case: If L is lesser than abs(R), sum is -ve
            if (*this < R.abs()) {
                L = *this;
                *this = R;
                Swapped = true;
            }
            /// Case: If L is greater or equal abs(R), sum is non -ve
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
 
 
        /// If a swap has occured, we need to subtract L from *this
        if (Swapped) Subtract(L);
        /// Otherwise, we need to subtract R from *this
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