# Arithmetic Operators
a=6
b=7
print("======================================")
print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b)
print(a**b)
print(a//b)
print("======================================")

# Assignment Operators
a=100
b+=20
print(b)
b-=5
print(b)
b*=3
print(b)
b/=5
print(b)
b%=2
print(b)
b**=3
print(b)
b//=2
print(b)
print("=====================================")

# Comparison Operators
a=11
b=12
print(a==b)
print(a<=b)
print(a>=b)
print(a!=b)
print(a<b)
print(a>b)
print("=====================================")

# Bitwise Operators
a=2
b=3
print(a&b)
print(a|b)
print(a^b)
print(~b)
print(a<<1)
print(a>>1)
print("=======================================")

# Logical Operators
a=2
b=5
if(a<b or a==b):
    print("a is less than or equal to b")

if(a<b and a!=b):
    print("a is less than b")

if(not a<b):
    print("a is not less than b")
print("=======================================")

# Identity Operators
a=2
b=a
print(a is b)    
print(a is not b)    
print("=======================================")

# Membership Operators
l=[1,2,3,4,5]
a=5
b=10
print(a in l)
print(b not in l)
print("=======================================")
