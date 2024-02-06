import pandas as pd

columns_to_include = ['Name', 'Age']

df = pd.read_csv('data.csv', usecols=columns_to_include)
print(df)