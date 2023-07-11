def add(a,b):
    result=a+b
#    print(f"Addition {a}+{b}={result}")
    return result

def sub(a,b):
    result=a-b
    print(f"Subtraction {a}-{b}={result}")
    return None

def main():
    a=eval(input("Enter the first  value-"))
    b=eval(input("Enter the second value-"))
    result=add(a,b)
    print(f"Addition {a} + {b} = { result }")
    return None    

main()
#################################################
def multiple(value):
    return value*10

def main2():
    num2=eval(input("Enter the num: "))
    result2=multiple(num2)
    print(f"Output-",result2)

main2()
