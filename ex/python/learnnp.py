import numpy as np


A = np.matrix([
    [1, -3, 1, 1],
    [-1, -1, 1, -1],
    [1, 2, 2, -1],
    [3, -1, -1, 2],
])
Y = np.matrix([[1, 0, 4, 2]]).T

print(np.linalg.solve(A, Y).T)  # Resolve o sistema linear Ax = Y
