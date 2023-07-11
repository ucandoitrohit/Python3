import os

c=[10,20]  # change accorgingly
#c=True
#c="Rohit"
#c=range(10)
##c=4.5
#c=3+4j
#c={}

k=1
for i in dir(os):
    if i.startswith("__") is False:
        print(k,i)
        k=k+1
