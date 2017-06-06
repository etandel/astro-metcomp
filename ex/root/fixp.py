import math


def f1(x):
    return math.log(3*x)


def fixp(x0, eps):
    xn = f1(x0)
    while abs(xn - x0) > eps:
        x0 = xn
        xn = f1(x0)
    return xn


print(fixp(1, 0.05))       
