import pandas as pd
 
def unique(li):
    unique_list = pd.Series(li).drop_duplicates().tolist()
    print(unique_list)
 
list = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list)