def fib(n):
    i=0
    j=1
    print(i,end=" ")
    print(j,end=" ")
    for i in range(2,n+1):
        k=i+j
        print(k,end=" ")
        i=j
        j=k

fib(10)