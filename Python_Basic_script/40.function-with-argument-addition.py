def add(a,b):
    result=a+b
    print(f"Addition {a}+{b}={result}")
    return None

def sub(a,b):
    result=a-b
    print(f"Subtraction {a}-{b}={result}")
    return None

def main():
    a=eval(input("Enter the first  value-"))
    b=eval(input("Enter the second value-"))
    add(a,b)
    sub(a,b)
    sub(10,3)
    return None    

main()