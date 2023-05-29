import getpass

#getpass module have below 2 function major we use

#getpass() and getuser()
#============================

print(dir(getpass))

# getpass() - function - it prompts the user for password without echoing. The getpass module provides a secure way to handle the password prompts where program interact with the user via the terminal
# getuser() - function - function display the login name of the user. this function check the envirnment variable LOGNAME, USER, LNAME and USERNME, in order and return the value of the first non-empty string


db_pass=getpass.getpass(prompt="Enter the DB Password:-")
print(f"You Password is-: {db_pass}")

print(getpass.getuser())