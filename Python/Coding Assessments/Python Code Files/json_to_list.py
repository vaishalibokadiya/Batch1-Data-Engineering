import json

json_string='{"name":"Vaishali","branch":"CSE","age":23}'

# json string to dict
dict=json.loads(json_string)

print(dict)
print(dict['name'])

json_list='[1,2,3,4,5,6,7]'

# json string to list
mylist=json.loads(json_list)
print(mylist)
print(mylist[5])