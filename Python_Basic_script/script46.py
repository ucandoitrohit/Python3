# call a script from another script
def addition(a,b):
    print(f"Addition-{a}+{b}={a+b}")
    return None


def subtraction(a,b):
    print(f"Subtraction-{a}-{b}={a-b}")
    return None

def main():
    x=4
    y=61
    addition(x,y)
    subtraction(x,y)
    return None

if __name__=="__main__":
    main()
    