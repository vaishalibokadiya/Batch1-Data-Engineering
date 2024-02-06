# sorted
mylist=[27,45,1,11,77,12,23]
print(sorted(mylist))
print(sorted(mylist,reverse=True))
print(mylist)

my_string_list=["Aman","Anand","Vaibhav","Vaishali","zainab"]
print(sorted(my_string_list, key=len))

sorted_my_string_list=sorted(my_string_list,key=len)

print(sorted_my_string_list)
print(my_string_list)

l=["zz","BB","XX","aa"]
print(sorted(l,key=str.lower))

def myFun(x):
    return x[-1]
li=["ab","Yz","zA","lJ"]
print(sorted(li,key=myFun))

# sort
names=["Aman","Anand","Vaibhav","Vaishali","zainab"]
names.sort(key=len)
print(names)