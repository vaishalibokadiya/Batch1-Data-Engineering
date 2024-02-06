with open("Participants.csv") as file:
    content=file.readlines()

header=content[:1]
rows=content[1:]
print(header)
print(rows)