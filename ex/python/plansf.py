from math import pi

from astropy.coordinates import ICRS
from matplotlib import *
from matplotlib.pyplot import *

# Algumas letras foram deixadas de lado
LetrasGregas = ('Alpha', 'Beta', 'Delta', 'Epsilon', 'Eta', 'Theta', 'Iota',
                'Kappa', 'Lambda', 'Mu', 'Nu', 'Xi', 'Omicron', 'Rho', 'Sigma',
                'Tau', 'Upsilon')

ax = subplot(111, projection = 'aitoff')
grid (True)

for letra in LetrasGregas:
    c1 = ICRS.from_name(letra + ' Ori')
    plot(c1.ra.rad, c1.dec.rad, 'or')
    c2 = ICRS.from_name(letra + ' Sco')

    # RA superiores a 180 graus precisam ser representadas como valores entre -pi e 0.
    plot(c2.ra.rad-2*pi, c2.dec.rad, 'ob')

ax.text(5*pi/12, pi/9, 'Orion', fontsize=15)
ax.text(-7*pi/12, -pi/6, 'Scorpio', fontsize=15)
show()
