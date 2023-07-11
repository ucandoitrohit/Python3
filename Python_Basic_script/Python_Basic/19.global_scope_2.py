def harry():
    x = 20
    def rohit():
        global x
        x = 88
    print("Before calling rohan()", x)
    rohit()
    print("after calling rohan()", x)
    harry()
print(x)