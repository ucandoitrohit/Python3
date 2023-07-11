import time

var1 = time.time()
#print(var1)
k = 0
while (k<40):
    print("While print")
    k = k + 1
print("TIme taken while ", time.time() - var1, "second")

var2 = time.time()
for i in range(40):
    print("for print")
print("TIme taken for ", time.time() - var2, "second")
    