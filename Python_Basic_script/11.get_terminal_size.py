import os
tt=os.get_terminal_size().columns   
print(tt)

str=input("Enter you string")
print(str.center(tt).title())
print(str.ljust(tt).title())
print(str.rjust(tt).title())
