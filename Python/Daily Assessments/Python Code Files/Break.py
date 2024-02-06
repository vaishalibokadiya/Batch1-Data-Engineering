inputString=input("Enter a string: ")
word=inputString.strip()
flag=0
for i in word:
    if i==' ':
        print("String is not a single word")
        flag=1
        break
    
if flag==0:
    print("String is a single word")
