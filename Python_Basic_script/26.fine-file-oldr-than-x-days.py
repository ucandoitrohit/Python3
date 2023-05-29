import os, datetime

#req_path = input("Enter the Path-")
path="E:\python_repo\Python3\Python_Basic_script"
today = datetime.datetime.today()
for each_file in os.listdir(path):
    each_file_path=os.path.join(path,each_file)
    if os.path.isfile(each_file_path):
        file_create_time=os.path.getctime(each_file_path)
        file_create_time_readable=datetime.datetime.fromtimestamp(file_create_time)
        diff_file=(today-file_create_time_readable).days
        if diff_file > 2:
            print(f"{each_file_path} --- {diff_file} Days")
