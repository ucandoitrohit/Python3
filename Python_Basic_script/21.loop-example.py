import os
import sys


path="E:\\python_repo\\Python3\\Python_Basic_script\\Test-Walk-Module"
if os.path.exists(path):
    df_l=os.listdir(path)
else:
    print("Please provide valid path-")
    sys.exit()

list_of_file_dir=os.listdir(path)
print("All file and dir-",list_of_file_dir)
for each_file_or_dir in list_of_file_dir:
#    print(each_file_or_dir)
    f_d_p=os.path.join(path,each_file_or_dir)
    if os.path.isfile(f_d_p):
        print(f"{f_d_p} is a file")
    else:
        print(f"{f_d_p} is a directory")    
