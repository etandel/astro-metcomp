import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import InterpolatedUnivariateSpline


XS = np.array([0., 1., 2., 3.8, -5, 3, 6])
FXS = np.array([1., 2., 4., -4., -5, 3, 6])


def spline_interpolate(xs, fxs, xinterp):
    return InterpolatedUnivariateSpline(xs, fxs)(xinterp)


def main():
    xinterp = np.linspace(XS.min() - 2, XS.max() + 2, 1000)
    yinterp = spline_interpolate(XS, FXS, xinterp)

    plt.figure()
    plt.plot(XS, FXS, 'xb', xinterp, yinterp, 'r')
    plt.show()


if __name__ == '__main__':
    main()
