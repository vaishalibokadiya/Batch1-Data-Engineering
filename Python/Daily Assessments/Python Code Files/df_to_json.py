import pandas as pd

data = {'Name': ['John', 'Emily', 'Michael', 'Sarah'],
        'Age': [25, 30, 28, 22],
        'Salary': [50000, 60000, 80000, 0]}
df = pd.DataFrame(data)

df.to_json('jsonfile.json', orient='records')
