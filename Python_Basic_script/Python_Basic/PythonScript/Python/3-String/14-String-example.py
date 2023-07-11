letter = ''' Dear <|NAME|>,
    You are Selected!

 Date: <|DATE|>   
'''

name = input("Enter the name:-")
date = input("\nEnter Date:-")
letter = letter.replace("<|NAME|>", name)
letter = letter.replace("<|DATE|>", date)
print(letter)