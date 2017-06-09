import numpy as np
import matplotlib.pyplot as plt


from newton import newton_interpolate
from spline import spline_interpolate

#XS = np.array([0., 1., 2., 3.8, -5, 3, 6])
#FXS = np.array([1., 2., 4., -4., -5, 3, 6])
#INTERP_EXTRA = 2
#VIEWPORT_EXTRA = 4

XS = np.array([0.2, 0.34, 0.4, 0.52, 0.6, 0.72])
FXS = np.array([0.16, 0.22, 0.27, 0.29, 0.32, 0.37])
INTERP_EXTRA = 0.5
VIEWPORT_EXTRA = 0.5

INTERP_N_POINTS = 1000


xinterp = np.linspace(XS.min() - INTERP_EXTRA,
                      XS.max() + INTERP_EXTRA, INTERP_N_POINTS)

plt.plot(XS, FXS, 'ob')

plt.xlim(XS.min() - VIEWPORT_EXTRA, XS.max() + VIEWPORT_EXTRA)
plt.ylim(FXS.min() - VIEWPORT_EXTRA, FXS.max() + VIEWPORT_EXTRA)

plt.plot(xinterp, newton_interpolate(XS, FXS, xinterp), 'r-')
plt.plot(xinterp, spline_interpolate(XS, FXS, xinterp), 'g-')

plt.show()
