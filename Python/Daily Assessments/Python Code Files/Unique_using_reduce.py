from functools import reduce
 
def unique(li):
 
    ans = reduce(lambda re, x: re+[x] if x not in re else re, li, [])
    print(ans)
 
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)
