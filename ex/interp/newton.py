import numpy as np
import matplotlib.pyplot as plt


def newton_divdiff(xs, fxs, at):
    grau = len(xs) - 1
#
    def prodjk(k, n):
        produto = 1
        for j, x in enumerate(xs):
            if (j != k):
                produto *= xs[k] - x
        return produto
#
    def prod(n):
        produto = 1
        for x in xs:
            produto *= at - x
        return produto
#
    def divdif(n):
        soma = 0
        for k, fx in enumerate(fxs):
            soma += fx / float(prodjk(k, n))
        return soma
#
    def pn(x, n):
        if n == 0:
            return fxs[0]
        else:
            return pn(x, n - 1) + divdif(n) * prod(n - 1)
#
    return pn(at, grau)


def newton_interpolate(xs, fxs, xinterp):
    return np.array([newton_divdiff(xs, fxs, x) for x in xinterp])


def main():
    XS = np.array([0., 1., 2., 3.8, -5, 3, 6])
    FXS = np.array([1., 2., 4., -4., -5, 3, 6])

    xinterp = np.linspace(XS.min() - 2, XS.max() + 2, 1000)
    yinterp = newton_interpolate(XS, FXS, xinterp)

    plt.plot(XS, FXS, 'ob')

    plt.xlim(XS.min() - 4, XS.max() + 4)
    plt.ylim(FXS.min() - 4, FXS.max() + 4)

    plt.plot(xinterp, yinterp, 'r--')
    plt.show()


if __name__ == '__main__':
    main()
