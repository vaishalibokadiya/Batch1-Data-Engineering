mylist1=[1,2,3,4,2,4,1,5,3,2,2]
mylist2=[2,9,6,2,4,5,2,7,1,2,2]
myset1=set(mylist1)
myset2=set(mylist2)
print("myset1=",myset1)
print("myset2=",myset2)
print("===============================")

myset1.add(12)
print("myset1=",myset1)
print("myset2=",myset2)
print("===============================")

union_set=myset1.union(myset2)
print("union_set=",union_set)
intersection_set=myset1.intersection(myset2)
print("intersection_set=",intersection_set)
difference_set=myset1.difference(myset2)
print("difference_set=",difference_set)
print("===============================")

myset1.clear()
print("myset1=",myset1)
print("myset2=",myset2)
myset1=myset2.copy()
print("myset1=",myset1)
print("myset2=",myset2)
myset1.discard(2)
print("myset1=",myset1)
print("myset2=",myset2)
myset2.remove(1)
print("myset1=",myset1)
print("myset2=",myset2)
myset2.pop()
print("myset1=",myset1)
print("myset2=",myset2)



