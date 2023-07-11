list = ["Harry", "Rohit", "New", "Test"]
for item in list:
    print(item)

list1 = [["Harry",1], ["Rohit",2], ["New",3], ["Test",4]]
for item1 in list1:
    print(item1)

list2 = [["Harry",1], ["Rohit",2], ["New",3], ["Test",4]]
for item2,num in list2:
    print(item2, num)

list4 = [["Harry",1], ["Rohit",2], ["New",3], ["Test",4]]
dict1 = dict(list4)
#print(dict1)

for item4 in dict1:
    print(item4)
