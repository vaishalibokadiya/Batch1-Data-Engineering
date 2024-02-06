import pandas as pd

with open("data.csv") as file:
    data=pd.read_csv(file)
    print(data)