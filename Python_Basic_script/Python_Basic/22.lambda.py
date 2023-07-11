def minus(a,b):
    return a-b
#or

minus1 = lambda a,b: a - b
print(minus(9,4))
print(minus1(7,4))

def a_first(a):
    return a[1]
a = [[1,34],[9,5],[66,55],[23,67]]
a.sort(key=a_first)
print(a)

#or

b = [[21,4],[49,51],[6,55],[23,7]]
b.sort(key=lambda x:x[1])
print(b)
