cube=lambda x:x*x*x
print(cube(5))

# with if-else
min = lambda a, b : a if(a < b) else b
print(min(2,5))

# lambda function with filter
ages = [13, 90, 17, 59, 21, 60, 5]
adults = list(filter(lambda age: age > 18, ages))
print(adults)

# lambda function with map
l = [5, 7, 22, 97, 54, 62, 77, 23, 73, 61]
final_list = list(map(lambda x: x*2, l))
print(final_list)

# lambda function with reduce
from functools import reduce
l = [5, 8, 10, 20, 50, 100]
sum = reduce((lambda x, y: x + y), l)
print(sum)