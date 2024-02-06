word=input("Enter a word: ")

for i in word:
    if i=='a' or i=='e' or i=='i' or i=='o' or i=='u':
        continue
    else:
        print(i)