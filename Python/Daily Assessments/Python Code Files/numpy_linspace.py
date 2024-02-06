import numpy as np

# linspace
print(np.linspace(1, 10))
print(np.linspace(1, 10, 7))
print(np.linspace(1, 10, 7, endpoint=False))

samples, spacing = np.linspace(1, 10, retstep=True)
print(samples,spacing)
samples, spacing = np.linspace(1, 10, 20, endpoint=True, retstep=True)
print(samples,spacing)
samples, spacing = np.linspace(1, 10, 20, endpoint=False, retstep=True)
print(samples,spacing)

