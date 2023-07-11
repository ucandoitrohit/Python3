f = open("rohit1.txt", "w")
f.write("New file added and new file created added by write")
f = open("rohit1.txt", "r")

content = f.read()
print(content)

f = open("rohit1.txt", "a")
f.write("New file added and append line in file created added by write\n")
f = open("rohit1.txt", "r")

content = f.read()
print(content)

