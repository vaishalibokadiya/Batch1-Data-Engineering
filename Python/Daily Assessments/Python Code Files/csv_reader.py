import csv
rows=[]
with open("Participants.csv","r") as file:
    csv_reader=csv.reader(file)
    header=next(csv_reader)
    for row in csv_reader:
        rows.append(row)
    print(header)
    print(rows)