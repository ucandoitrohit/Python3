class employee:
    no_of_leave = 33

    def details(self):
        return f"NAme is {self.name} age is {self.age} role is {self.role}"

object1 = employee()
object2 = employee()

object1.name = "rohit"
object1.age = 44
object1.role ="admin"

object2.name = "don"
object2.age = 44
object2.role ="mgmt"

print(object1.details())
print(object2.details())