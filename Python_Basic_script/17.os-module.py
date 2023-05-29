import os

# this module is used to work with operating system to automate many more task like creating, removing , identifying current directory and more

#Operation od OS module have 4 part
# 1. os
# 2. os.path
# 3. os.system()
# 4. os.walk()

# 1. Simple OS operations
# ===========================

print(os.sep)
print("==========================")
print(os.sep)
print("==========================")
#os.chdir(path))

path="C:\\Users\\lenovo\\AppData\\Local\\Programs\\Python\\"
os.chdir(path)

print(os.chdir())

print("==========================")
os.listdir()
print("==========================")
os.listdir(path)
print("==========================")
os.mkdir(path)
print("==========================")
os.makedirs(path) # Recursive directory creation function
print("==========================")
os.remove(path)
print("==========================")
os.removedirs(path)

print("==========================")
os.rmdir(path)
print("==========================")
#os.rename(src, dst)
print("==========================")
os.environ()
print("==========================")
os.getuid()
print("==========================")
os.getpid()
print("==========================")
print("==========================")


