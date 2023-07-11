import os, time
file_name = input("Enter the full path-")

if os.path.exists(file_name):
    print("File {0} is there".format(file_name))
    access_file = os.path.getatime(file_name)
    creation_fi = os.path.getctime(file_name)
    modify_file = os.path.getmtime(file_name)
    print("Last access time-", access_file)
    print("Creation access time-", creation_fi)
    print("Modified access time-", modify_file)
    
else:
    print("File {0} not there".format(file_name))
