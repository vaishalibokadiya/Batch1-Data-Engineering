import csv

with open('Participants.csv', 'r') as file:
    reader = csv.DictReader(file)

    for row in reader:
        name = row['Name']
        age = row['Age']
        city = row['City']

        print(f"Name: {name}, Age: {age}, City: {city}")
