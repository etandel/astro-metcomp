import numpy as np
import matplotlib.pyplot as plt


X_LIST = np.array([0., 1., 2., 3.8, -5, 3, 6])
Y_LIST = np.array([1., 2., 4., -4., -5, 3, 6])
N = len(X_LIST)


def lagrange_pol(x, i):
    mult = 1

    for j in range(N):
        if j != i:
            mult *= (x - X_LIST[j]) / float(X_LIST[i] - X_LIST[j])

    return mult


def pn(x):
    total = 0
    for i, y in enumerate(Y_LIST):
        total += y * lagrange_pol(x,i)
    return total

# Calcula o polinomio de Lagrange em cada x
xinterp = np.linspace(X_LIST.min() - 2, X_LIST.max() + 2, 1000)
yinterp = np.array(map(pn, xinterp))


plt.plot(X_LIST,Y_LIST,'ob')

plt.xlim(X_LIST.min()-4,X_LIST.max()+4)
plt.ylim(Y_LIST.min()-4,Y_LIST.max()+4)

plt.plot(xinterp,yinterp,'r--') ; plt.show()
