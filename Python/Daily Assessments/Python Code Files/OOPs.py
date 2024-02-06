class Animal:
    def __init__(self, name):
        self.name=name
    
    def speak(self):
        print("I am an animal.")

#  Inheritance
class Dog(Animal):
    attr1 = "mammal"
 
    # Constructor
    def __init__(self, name):
        self.name = name
         
    # Polymorphism and method over riding
    def speak(self):
        print(f"My name is {self.name}.")
 
# Objects
Rodger = Dog("Rodger")
Tommy = Dog("Tommy")
 
# Accessing class methods
Rodger.speak()
Tommy.speak()
