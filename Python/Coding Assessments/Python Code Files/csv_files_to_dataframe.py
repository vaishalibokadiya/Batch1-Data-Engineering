import pandas as pd
rows=[]
df=pd.DataFrame()
with open("data.csv") as file:
    data=pd.read_csv(file)
    df=pd.DataFrame(data)
    print(df)