#a = 'python'
a = list()
print("DataType is ---->",type(a), "\n====================")
z = [ x     for x in dir(a)     if  x.startswith("__") is False]

count = 1
for temp in z:
   print(count, "]", temp)
   count +=1
   
'''
a = [4,5]
print(dir(a))
print(help(a.append))

help(list)
'''