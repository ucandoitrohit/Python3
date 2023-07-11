import script46 
# call a script from another script
#print(dir(script46))
def multi(a,b):
    print(f"Addition-{a}*{b}={a*b}")
    return None

def main():
    x=20
    y=50
    #multi(x,y)
    script46.addition(x,y)
    #script46.addition(10,3)
    #script46.subtraction(20,22)
    #46.function-call-script-from-another-script(x,y)


if __name__=="__main__":
    main()
