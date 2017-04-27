def f(x):
    return x**3 - 5.0 * x + 10


def sig(x):
    return '-' if x < 0 else '+'


def avg(a, b):
    return (a + b) / 2.0


def bissec(a, b, eps):
    while abs(a - b) > eps:
        x = avg(a, b)

        print('\t'.join(map(str, (a, b, x, sig(f(a)), sig(f(x))))))

        if f(x) * f(a) > 0.0:
            a = x
        else:
            b = x

    return avg(a, b)


print(bissec(-4, -2, 0.01))
