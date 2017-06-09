import scipy as sp
import numpy as np
from scipy import stats

# 100 numeros aleatorios de distribuicao normal
s = sp.randn(100)

# Variancia de s
print("Variancia : {0:8.6f}".format(sp.var(s)))

# Momentos estatisticos de s
n, min_max, mean, var, skew, kurt = stats.describe(s)
print(n, min_max, mean, var, skew, kurt)


def pow3(x):
    return x**3

print(sp.optimize.fsolve(pow3, 10))
