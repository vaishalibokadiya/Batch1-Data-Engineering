import numpy as np

cvalues = [20.1, 20.8, 21.9, 22.5, 22.7, 22.3, 21.8, 21.2, 20.9, 20.1]
C = np.array(cvalues)
print(C)

fvalues = [ x*9/5 + 32 for x in cvalues] 
print(fvalues)

# arrange
a = np.arange(1, 10)
print(a)


x = range(1, 10)
print(x) 
print(list(x))


x = np.arange(10.4)
print(x)
x = np.arange(0.5, 10.4)
print(x)
x = np.arange(0.5, 10.4, 0.8)
print(x)
x = np.arange(0.5, 10.4, 0.8, int)
print(x)

