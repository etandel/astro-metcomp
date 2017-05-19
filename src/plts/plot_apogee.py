import csv
import math
from operator import itemgetter

from matplotlib.pyplot import plot, subplot, show, grid


ax = subplot(111, projection="aitoff")
grid(True)


reader = csv.reader(open('apogee.csv'),)
next(reader)  # throw away header
for ra, dec in reader:
    ra, dec = math.radians(float(ra)), math.radians(float(dec))
    if ra > math.pi:
        ra -= - 2 * math.pi
    plot(ra, dec, 'ob')

show()

