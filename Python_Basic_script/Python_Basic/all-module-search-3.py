import os
c=1
search_keyword=input("Enter word-")
for i in dir(os):
    if not "_" in i:
        if search_keyword in i:
            print(c,i)
            c=c+1
            
