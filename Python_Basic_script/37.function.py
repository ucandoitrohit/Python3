import os
import time
import platform
def mycode(cmd1,cmd2):
    print("Please wait.. cleaning")
    time.sleep(1)
    os.system(cmd1)
    print("Wait...")
    time.sleep(1)
    os.system(cmd2)

if platform.system()=="Windows":
    mycode("cls","dir")
else:
    mycode("clear","ls -ltr")    