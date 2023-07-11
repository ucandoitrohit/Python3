# Normal vaule always should be first then agrs and kwargs
def funargs1(normal_value, *args, **kwargs):
    print(normal_value)
    for i in args:
        print(i)
    print("---------------------------")
    for key, value in kwargs.items():
        print(f"{key} is a {value}")

list1 = ["Apple","Cow","Men","Male","Desi"]
normal_value = "This is normal"
list2 = {"Name":"Rohit","Class":"8","Subject":"Math"}
funargs1(normal_value, *list1, **list2)


