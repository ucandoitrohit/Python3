import platform
# is used to access the underlying  platform data such as hardware OS aand interpreter version info

# How to use platform module in a script
# ==========================================
# import platform
# import platform as pt
# from platform import *
# from platform import system,platform

# How to list all function and variable of a platform module
#==================================================================
# dir()
#Example
# print(dir(platform))

# How to get help of a platform module
#========================================
# From Script:  print(help(platform))
# From Python:  help(platform)


# if we don't know system or python_version is variable or functon then goto python IDE or use below sytnx
print(platform.system)

print(f"OS is-{platform.system()}")
#print(dir(platform))
# select any function

print(platform.python_version)

print(f"Python Version-{platform.python_version()}")

print(platform.machine)

print(f"Python Version-{platform.machine()}")
print(f"Python Version-{platform.release()}")

print(f"Python Version-{platform.platform()}")

print(f"Python Version-{platform.architecture()}")
print(f"Python Version-{platform.processor()}")
print(f"Python Version-{platform.node()}")
print(f"Python Version-{platform.uname()}")

# Q Write a script to clear any terminal of OS
# or
# Platform Independent script to clear terminal

import os
if platform.system()=="Windows":
    os.system("cls")
else:
    os.system("clear")

