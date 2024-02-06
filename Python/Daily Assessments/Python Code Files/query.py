import pandas as pd
  
d = pd.read_csv("data.csv")
b = pd.DataFrame(d)

filtered_df = d.query('Age > 25')
print(filtered_df)
