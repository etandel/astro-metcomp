import csv

from numpy import *
from matplotlib.pyplot import plot, show

x = []
fx = []

# dados que serao interpolados
data = [[2,5],[3,4],[4,2.5],[5,0]]

data = [map(float, row) for row in csv.reader(open('data.csv'))]

n = len(data)

# construcao da matriz X e vetor fx
for i in range(n):
    linha = [data[i][0]**float(j) for j in range(n)]

    x.append(linha)
    fx.append(data[i][1])


# adaptacao da lista para um array numpy
x = array(x)
fx = array(fx)
a = linalg.solve(x,fx)


def interpolated(x):
    return sum(a * x**i for i, a in enumerate(a))


xs = [data[i][0] for i in range(n)]
plot(xs, fx, 'xb')

newxs = arange(xs[0], xs[-1], 0.1)
plot(newxs, map(interpolated, newxs))
show()
