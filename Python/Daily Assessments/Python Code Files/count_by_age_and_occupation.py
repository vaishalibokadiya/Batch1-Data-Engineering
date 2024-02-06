import pandas as pd
  
df = pd.read_csv("data.csv")
b = pd.DataFrame(df)

print("Count of people ->",
      df[(df['Age'] > 25) & (df['Occupation'] == "Teacher")]['Name'].count())
