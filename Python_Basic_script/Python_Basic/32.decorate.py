
def decorate_func(any_function):
    def wrapper_func():
        print("This decorate function")
        any_function()
    return wrapper_func

@decorate_func
def func1():
    print("Calling function 1")
func1()

@decorate_funcprint("Hello 'Rohit' Worl")

def func2():
    print("Calling function 2")
func2()