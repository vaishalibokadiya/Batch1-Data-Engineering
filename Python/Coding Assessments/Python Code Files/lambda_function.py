# lambda function
area_of_rectangle=lambda l,b:l*b

print("Area of rectangle of length=5 and breadth=2 is",area_of_rectangle(5,2))

ages=[11,32,65,25,89,46,23,56,98,45,9,24,12]

# lambda function in filter method
adults=filter(lambda age: age>18, ages)
adults_list=list(adults)
print("list of ages of adults is:\n",adults_list)