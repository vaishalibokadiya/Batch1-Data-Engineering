import pandas as pd
  
d = pd.read_csv("data.csv")

filtered_df = d.query('Age > 18')
print(filtered_df)
