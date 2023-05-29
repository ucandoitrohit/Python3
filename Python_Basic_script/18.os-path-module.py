import os

path="E:\\python_repo\\Python3\\Python_Basic_script\\1.print.py"
print(os.path.sep)

print(os.path.basename(path))
print(os.path.dirname(path))

p1="E:\python_repo"
p2="Python2\\Python_Basic_script"

print(os.path.join(p1,p2))
# split --> used to split the path nme into a pair head and tail
print(os.path.split(path))

print(os.path.getsize(path))
print(os.path.exists(path))

print(os.path.isfile(path))
print(os.path.isdir(p1))
print(os.path.islink(path))



