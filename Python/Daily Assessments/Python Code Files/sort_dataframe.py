import pandas as pd

df = pd.read_csv("data.csv")
b = pd.DataFrame(df)
print(df)

df_sorted = df.sort_values(by='Age')

print("Sorted DataFrame by Age in Ascending order:")
print(df_sorted)

df_sorted_desc = df.sort_values(by='Age', ascending=False)

print("Sorted DataFrame by Age in Descending order:")
print(df_sorted_desc)