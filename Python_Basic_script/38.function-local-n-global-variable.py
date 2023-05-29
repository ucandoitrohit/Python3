def function1():
    x=60    # Local Variable
    print("x value from fun1 ",x)
    
    return None

def function2(y):
    print("x value from fun2 ",y)
    return None

x=10    # Global variable
#function1()

def main():
#    global x
    x=90
    function1()
    function2(x)

main()