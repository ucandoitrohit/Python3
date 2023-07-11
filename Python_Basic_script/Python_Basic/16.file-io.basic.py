f = open("rohit.txt")
content = f.read()
print(content)
f.close()

f = open("rohit.txt","r")
content = f.read()
print(content)
f.close()

f = open("rohit.txt","br")
content = f.read()
print(content)
f.close()


f = open("rohit.txt","tr")
content = f.read(3)
print(content)
content = f.read(3)
print(content)
f.close()


f = open("rohit.txt","rt")
for i in f:
    print(i, end="")
f.close()


f = open("rohit.txt","rt")
print(f.readline())

f = open("rohit.txt","rt")
print(f.readlines())



