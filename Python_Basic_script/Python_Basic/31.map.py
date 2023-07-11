list1 = ["23","43","4"]
list1 = list(map(int, list1))
list2 =list1[2]+1
print(list2)

num1 = [1,2,3,4,5,6,7,8,9]
square = list(map(lambda x: x*x, num1))
print(square)


##########Filter#################
list1 = [1,2,3,4,5,6,7,8,9]

def is_greater(num):
    return num>2

list2= list(filter(is_greater,list1))
print(list2)
###############Reduce################
from functools import reduce
list3 = [1,2,3,4]
num = reduce(lambda x,y:x+y, list3)
print(num)