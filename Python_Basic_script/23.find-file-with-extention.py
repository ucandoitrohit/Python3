import os, sys

#path="E:\\python_repo\\Python3\\Python_Basic_script\\Test-Walk-Module\\Empty"
path="E:\\python_repo\\Python3\\Python_Basic_script\\Test-Walk-Module\\"

#req_path=input("Enter the Directory path-")

if os.path.isfile(path):
    print(f"Please pass directory path-")
else:
    all_f_ds=os.listdir(path)
    if len(all_f_ds)==0:
        print(f"Given Path is empty {path}")
    else:
        req_exte=input("Enter the file Extensino(.py/.sh/.txt/.log-")
        req_files=[]
        for each_f in all_f_ds:
            if each_f.endswith(req_exte):
                req_files.append(each_f)
        if len(req_files)==0:
            print(f"There is no file {req_exte} with extension")
        else:
            print(f"There r {len(req_files)} file in location {path} at extension {req_exte}")
            print(f"The required file are-{req_files}")


       
