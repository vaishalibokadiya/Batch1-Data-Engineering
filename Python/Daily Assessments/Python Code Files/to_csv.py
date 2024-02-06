import pandas as pd
header=['Name', 'Class', 'Rollno']
data=[['Aman','6th',12375],['Vaibhav','10th', 87456],['Surbhi','9th', 78907]]
data=pd.DataFrame(data,columns=header)
data.to_csv('Student.csv', index=False)