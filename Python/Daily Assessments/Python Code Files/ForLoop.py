def factorial(n):
    res=1
    for i in range(1,n+1):
        res=res*i
    print(res)

num=int(input("Enter number to find its factorial: "))
factorial(num)