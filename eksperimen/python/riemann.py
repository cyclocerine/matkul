import numpy as np
import scipy.integrate as spi

def riemann_sum(f, a, b, dx, method='midpoint'):
    # Jika (b-a)/dx bukan bilangan bulat, ceil akan membulatkannya ke atas
    # untuk memastikan seluruh rentang terliput. Namun, biasanya dx dihitung dari n.
    # Di sini, karena kita disuruh memakai "lebar partisi dx", kita hitung n:
    n = max(1, int(np.ceil((b - a) / dx)))
    # kita hitung ulang dx aktual agar persis mengisi interval
    actual_dx = (b - a) / n
    
    if method == 'left':
        x = np.linspace(a, b - actual_dx, n)
    elif method == 'right':
        x = np.linspace(a + actual_dx, b, n)
    elif method == 'midpoint':
        x = np.linspace(a + actual_dx/2, b - actual_dx/2, n)
    return np.sum(f(x) * actual_dx)

problems = [
    {
        "id": 1,
        "func_str": "x",
        "f": lambda x: x,
        "a": 0, "b": 4
    },
    {
        "id": 2,
        "func_str": "2x^3 + 5",
        "f": lambda x: 2 * x**3 + 5,
        "a": -1, "b": 3
    },
    {
        "id": 3,
        "func_str": "3sin(x) + 4cos(x) + 2",
        "f": lambda x: 3 * np.sin(x) + 4 * np.cos(x) + 2,
        "a": 0, "b": np.pi
    },
    {
        "id": 4,
        "func_str": "(5x^4 + 2x^2 - 7) / sqrt(x)",
        "f": lambda x: (5 * x**4 + 2 * x**2 - 7) / np.sqrt(x),
        "a": 1, "b": 4
    },
    {
        "id": 5,
        "func_str": "x * sqrt(x^2 + 9)",
        "f": lambda x: x * np.sqrt(x**2 + 9),
        "a": 0, "b": 4
    },
    {
        "id": 6,
        "func_str": "sqrt(x^2 + x) * (4x + 2)",
        "f": lambda x: np.sqrt(x**2 + x) * (4 * x + 2),
        "a": 0, "b": 1
    },
    {
        "id": 7,
        "func_str": "(x+1)/(x^2+2x+6)",
        "f": lambda x: (x + 1) / (x**2 + 2 * x + 6),
        "a": 1, "b": 3
    },
    {
        "id": 8,
        "func_str": "x * sec^2(x)",
        "f": lambda x: x * (1 / np.cos(x)**2),
        "a": 0, "b": np.pi / 4
    },
    {
        "id": 9,
        "func_str": "x^2 * ln(x^3 + 1)",
        "f": lambda x: x**2 * np.log(x**3 + 1),
        "a": 2, "b": 5
    },
    {
        "id": 10,
        "func_str": "sqrt(x + 1)",
        "f": lambda x: np.sqrt(x + 1),
        "a": -1, "b": 8
    }
]

for p in problems:
    res_1 = riemann_sum(p['f'], p['a'], p['b'], 1.0)
    res_001 = riemann_sum(p['f'], p['a'], p['b'], 0.01)
    
    # Calculate exact integral just for comparison
    exact, _ = spi.quad(p['f'], p['a'], p['b'])
    
    print(f"Soal {p['id']}: integral {p['func_str']} dari {p['a']:.2f} sampai {p['b']:.2f}")
    print(f"  dx = 1    : {res_1:.6f} (Error: {abs(res_1 - exact):.6f})")
    print(f"  dx = 0.01 : {res_001:.6f} (Error: {abs(res_001 - exact):.6f})")
    print(f"  Eksak     : {exact:.6f}")
    print("-" * 50)
