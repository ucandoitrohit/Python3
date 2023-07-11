class employee:
    no_of_leave = 33

    pass

object1 = employee()
object2 = employee()

object1.name = "rohit"
object1.age = 44
object1.role ="admin"

object2.name = "don"
object2.age = 44
object2.role ="mgmt"

print(object1.name, object2.name)
print(object1.no_of_leave)
print(employee.no_of_leave)
print(object1.no_of_leave)
object1.no_of_leave = 66
print(object1.__dict__)
print(object1.no_of_leave)
