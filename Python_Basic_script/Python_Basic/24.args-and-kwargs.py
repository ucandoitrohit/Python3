# def fun1(a,b,c,d):
#     print(a,b,c,d)

# fun1("1","2","3","4")

# def funargs(*args):
#     for i in args:
#         print(i)

# list = ["Apple","Cow","Men","Male","Desi"]
# funargs(*list)

# Normal vaule always should be first then agrs and kwargs
def funargs1(normal_value, *args):
    print(normal_value)
    for i in args:
        print(i)

list1 = ["Apple","Cow","Men","Male","Desi"]
normal_value = "This is normal"
funargs1(normal_value, *list1)

