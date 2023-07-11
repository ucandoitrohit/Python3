import os
for r,d,f in os.walk("D:\\"):
    for file in f:
        print(file)