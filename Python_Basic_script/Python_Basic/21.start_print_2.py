print("How many row you want to print")
one = int(input())
print("which Type 1 or 0")
two = int(input())
new = bool(two)

if new == True:
    for i in range(0, one+1):
            print("*"*int(i))
elif new == False:
    for i in range(one,0, -1):
        for j in range(1, i+1):
            print("*"*int(i))

