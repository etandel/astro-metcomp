import csv

import numpy as np
from matplotlib.pyplot import plot, show


def interpolate(xs, ys):
    xs = np.array(xs)
    ys = np.array(ys)

    powers = np.arange(len(xs))

    lines = np.array([
        x ** powers
        for x in xs
    ])

    coefficients = np.linalg.solve(lines, ys)

    def interpolated(x):
        return np.dot(coefficients, x ** powers)

    return interpolated


data = [map(float, row) for row in csv.reader(open('data.csv'))]
xs, ys = zip(*data)

interpolated = interpolate(xs, ys)

newxs = np.linspace(xs[0]-1, xs[-1]+1, 100)
plot(newxs, map(interpolated, newxs))
plot(xs, ys, 'or')
show()
