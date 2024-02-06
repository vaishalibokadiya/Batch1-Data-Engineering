import pandas as pd
 
df = pd.read_csv("data.csv")
print(df.head())

import pandas as pd
 
df = pd.read_table("data.csv", delimiter =", ")
print(df.head())


import csv
 
with open("data.csv") as csv_file:
    csv_reader = csv.reader(csv_file)
    df = pd.DataFrame([csv_reader], index = None)
 
for i in range(0, len(list(df))):
    for val in list(df[i]):
        print(val)
