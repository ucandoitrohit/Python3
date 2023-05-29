import os

#os.wlk(path) --> used to generate directory and file name in the directory tree by wlking

path="E:\\python_repo\\Python3\\Python_Basic_script\\Test-Walk-Module"
print(os.walk(path))
print(list(os.walk(path)))

# always generate list
print("========================")
for each in list(os.walk(path)):
    print(each)

print("========================")
for root,sub,file in os.walk(path):
    print(root,sub,file)

print("========================")
for root,sub,file in os.walk(path,topdown=True):
    print(root,sub,file)

print("========================")
for root,sub,file in os.walk(path,topdown=True):
    if len(file) !=0:
        print(root,sub,file)

print("========================")
for root,sub,file in os.walk(path,topdown=True):
    if len(file) !=0:
        print(root)
        for each_file in file:
            print(os.path.join(root,each_file))


# Q . How to do a system wide search for a file?
#===================================================
print("==============================================")
'''
#path2="E:\\python_repo"
path2=input("Enter the Drive name-")
file_name=input("Enter your File name-")
for root2,subdir,file2 in os.walk(path2):
    for each_f in file2:
        if each_f==file_name:
            print(os.path.join(root2,each_f))
'''
print("==============================================")
import os
import string
pd_name=string.ascii_uppercase
print(pd_name)
for each_drive in pd_name:
    myd = each_drive + ":\\"
    if os.path.exists(myd):
        print(myd)

print("==============================================")
import os
import string
file_name3=input("Enter your File name-")
pd_name=string.ascii_uppercase
vd_name=[]
print(pd_name)
for each_drive in pd_name:
    myd = each_drive + ":\\"
    if os.path.exists(myd):
        vd_name.append(myd)
        print(myd)
print(vd_name)    

for each_drive3 in vd_name:
    for root3, dir3,file3 in os.walk(each_drive3):
        for each_f3 in file3:
            if file_name3==each_drive3:
                print(os.path.join(root3,each_f3))

