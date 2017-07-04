import numpy as np
import scipy as sp


def f1(x):
    return np.tan(4.0 * x / 3.0)


def f2(x):
    return np.exp(np.log(1.0 / x))


def f3(x):
    return 4.0 * x ** 2.3 - np.cos(x) / (x ** 2.0)


def f4(m):
    if 0.4 < m <= 1.0:
        return m ** -0.25
    elif m <= 2.0:
        return m ** -1
    elif m <= 10.0:
        return 1.23 * m ** -1.3
    elif m <= 50.0:
        return 12.3 * m ** -2.3

