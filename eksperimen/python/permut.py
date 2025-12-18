def permutasi_sama(n, k_list):
    from math import factorial

    x = 1
    for k in k_list:
        x *= factorial(k)
    return factorial(n) // x


n = input("(n): ")
k_input = input("jumlah unsur yang sama(pisahkan dengan space): ")
k_list = list(map(int, k_input.split()))
result = permutasi_sama(int(n), k_list)
print(f"Jumlah permutasi yang mungkin: {result}")