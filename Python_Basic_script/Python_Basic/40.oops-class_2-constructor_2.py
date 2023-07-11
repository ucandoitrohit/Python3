class employee:
    no_of_leave = 33
    def __init__(self, aname, aage, arole):
        self.name = aname
        self.age = aage
        self.role = arole
        
    def details(self):
        return f"NAme is {self.name} age is {self.age} role is {self.role}"

object1 = employee("Rohit","34","admin")
object2 = employee("Don","45","desktop")

print(object1.details())
print(object2.details())