l = 10  #global variable
def fun1(n):
    global l
    l = l+ 3       #local variable
    b = 4       #local variable
    print(n,"function desription")
    print(l,b)
fun1("Calling function ")
#print(l)