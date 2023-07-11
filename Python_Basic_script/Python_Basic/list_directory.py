import os
dir_name = input("ENter dir name-")
file_ex = input("Enter file name-")
for item in os.listdir(dir_name):
    if item.endswith(file_ex):
        print(item)