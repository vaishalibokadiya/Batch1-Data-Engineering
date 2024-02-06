import json
 
with open('data.json') as json_file:
    data = json.load(json_file)
 
    print("Type:", type(data))
 
    print(data['people1'][0])
     
    print("Printing nested dictionary as a key-value pair")
    for i in data['people1']:
        print("Name:", i['name'])
        print("Website:", i['website'])
        print("From:", i['from'])

with open('employee.json') as file:
    data = json.load(file)
 
    for i in data['emp_details']:
        print(i)

    print(data['emp_details'][0]["emp_name"])
