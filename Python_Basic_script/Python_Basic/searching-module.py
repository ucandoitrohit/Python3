import os
keyword = input("Searching Keyword:-")
c = 1

for m in dir(os):
    if not m.startswith("_"):
        if keyword in m:
            print(c,m)
            c = c + 1 
