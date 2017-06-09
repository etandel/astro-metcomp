from math import exp, sin

# def f(x):
#     return 1.0 - exp(x) / 20.0 + sin(x / 2.0)

def f(x):
    return x**3 -5*x + 10


def bissec(a, b, eps):
    while abs(b - a) > eps:
        x = (a + b) / 2
        if f(a) * f(x) > 0:
            a = x
        else:
            b = x
    
    x = (a + b) / 2
    return x

x = bissec(-4.0, -2.0, 0.01)
print(x, f(x))
