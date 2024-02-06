def unique(x):
 
    list_set = set(x)

    unique_list = (list(list_set))
    for x in unique_list:
        print(x) 
 
nums = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(nums)