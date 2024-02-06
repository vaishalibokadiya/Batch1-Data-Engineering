import numpy as np
 
def unique(li):
    x = np.array(li)
    print(np.unique(x))
 
 
list1 = [10, 20, 10, 30, 40, 40]
print("The unique values from list are")
unique(list1)