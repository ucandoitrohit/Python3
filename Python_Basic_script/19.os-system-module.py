import os

# os.system() is used  to execute os command

print(os.system("clear"))
print(os.system("pwd"))
print(os.system("ls"))
print(os.system("dir"))
dd="date"
rt=os.system(dd)
if rt==0:
    print("Run")
else:
    print("Not")



