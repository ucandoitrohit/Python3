'''
Rules:
Should not conatin Space
Length of password between 5-10
At least 1 Numeric
At least 1 special chaceter
'''
from getpass import getpass
from string import punctuation
print(punctuation)
def password_validator(password):
    if ' ' in password:
        return "There is Space in Password"

    if len(password) not in range(5,11):
        return "PAssword must be between 5 - 10"

    special_char = [True for x in password if x in punctuation]
    if len(special_char) == 0:
        return "Special char not conatin"

    nums = any(x.isdigit() for x in password)
    if not nums:
        return "No digit"

    return f"Your Password {password} is correct"

Password = getpass("Enter the Password:-")
print(Password)
print(password_validator(Password))