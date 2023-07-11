x=input("Enter Three digit number:-")
y=len(x)
print(y)
i=0
result=0
while(i < y):
    result = result + int(x[i])
    i=i+1
print(result)
