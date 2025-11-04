n = int(input("Masukkan angka untuk dihitung faktorialnya: "))

def faktorial(num):
    if num == 0 or num == 1:
        return 1
    else:
        return num * faktorial(num - 1)
result = faktorial(n)
print(f"Faktorial dari {n} adalah: {result}")