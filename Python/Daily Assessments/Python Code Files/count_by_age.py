import pandas as pd
  
df = pd.read_csv("data.csv")
b = pd.DataFrame(df)

print(df.count())

print(df.count(axis = 1)) 
print(df.count(axis = 'columns'))

print("Count of people whose age is greater than 25 is",
      df[df['Age'] > 25]['Name'].count())
