import csv
csv_file="E:\\python_repo\\Python3\\Python_Basic_script\\emp.csv"
fo=open(csv_file,'r')
content=fo.readlines()
fo.close()
for each in content:
    print(each.strip("\n"))
print("################################################")
fo2=open(csv_file,'r')
data2=csv.reader(fo2,delimiter=",")
for each2 in data2:
    print(each2)
fo2.close()

print("################################################")
fo2=open(csv_file,'r')
data3=csv.reader(fo2,delimiter=",")
print(f"Header are:-\n {list(data3)[0]}")

fo2.close()

print("################################################")
fo2=open(csv_file,'r')
data4=csv.reader(fo2,delimiter=",")
next(data4)
for each4 in data4:
    print(each4)
fo2.close()



print("################################################")
fo2=open(csv_file,'r')
data5=csv.reader(fo2,delimiter=",")
header=next(data5)
print(f"Hearer are-",header)
#print(list(data5))
print("The no of rows:-",len(list(data5)))

fo2.close()


