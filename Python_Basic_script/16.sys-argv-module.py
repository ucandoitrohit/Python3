import sys

# sys.argv return a list of command line argument passed to a python script

print(sys.argv)


# Run
#======
# python 16.sys-argv-module.txt Python ROhit 3 5.7 Script

# index 0 always script name
print(sys.argv[0])

# example

print("============================================")
if len(sys.argv) != 3:
    print("Usage")
    print(f'{sys.argv[0]} <you_statement> <lower|upper|title>')
    print(f'{sys.argv[0]} example:-')
    print(f'{sys.argv[0]} Your python IS AWOSOME LanGUgE <lower|upper|title>')
    sys.exit()

user_str=sys.argv[1]
user_act=sys.argv[2]

if user_act=="lower":
    print(user_str.lower())
elif user_act=="upper":
    print(user_str.upper())
elif user_act=="title":
    print(user_str.title())
else:
    print("Invalid")

 # to run the script
 # python 16.sys-argv-module.txt "Python Example for Sys Argv" title