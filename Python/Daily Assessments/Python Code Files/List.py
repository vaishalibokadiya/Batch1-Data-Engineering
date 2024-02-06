mylist=[1,2,3,4,1.25]

# Accessing elements
print(mylist[2])

# append
mylist.append(2.50)
print(mylist)

# pop
print(mylist.pop())
print(mylist)

# remove
mylist.remove(4)
print(mylist)

# insert
mylist.insert(2,20)
print(mylist)

# length
print(len(mylist))

# sort
mylist.sort()
print(mylist)

# slice
print(mylist[1:5])

# iterating over list
for i in mylist:
    print(i)