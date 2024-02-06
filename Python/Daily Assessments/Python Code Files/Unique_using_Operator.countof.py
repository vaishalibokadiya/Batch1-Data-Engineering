import operator as op 
 
def unique(li):
 
    unique_list = []
 
    for x in li:
        if op.countOf(unique_list, x) == 0:
            unique_list.append(x)

    print(unique_list)
 
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)
