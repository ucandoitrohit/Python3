import getpass
import pprint
print(dir(getpass))
pprint.pprint(dir(getpass))

myuser = input("Enter the username")
mypass = getpass.getpass("Enter the password")
print(myuser)
print(mypass)

print(getpass.getuser())

