#f = open("rohit4.txt", "w")
f = open("rohit4.txt", "r+")
print(f.read())

f.write("new added line")
print(f.read())
