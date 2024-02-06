num1=int(input("Enter a number: "))
num2=int(input("Enter another number: "))
operator=input("Enter the operator: ")
if operator=='+':
    print(num1+num2)
elif operator=='-':
    print(num1-num2)
elif operator=='*':
    print(num1*num2)
elif operator=='/':
    print(num1/num2)
elif operator=='%':
    print(num1%num2)
elif operator=='**' or operator=='^':
    print(num1**num2)